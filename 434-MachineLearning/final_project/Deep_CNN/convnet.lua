require 'torch'
require 'cudnn'
require 'cunn'
require 'nn'

cmd = torch.CmdLine()
cmd:text()
cmd:text('Train a CNN MNIST model')
cmd:text()
cmd:text('Options')
-- data
cmd:option('-data_dir','data/lewis','data directory. Should contain the file input.txt with input data')
-- model params
cmd:option('-cnn_size', 128, 'size of CNN internal state')
cmd:option('-num_layers', 2, 'number of layers')
-- optimization
cmd:option('-optim', 'sgd', 'optimization algorithm')
cmd:option('-learning_rate',2e-3,'learning rate')
cmd:option('-learning_rate_decay',0.97,'learning rate decay')
cmd:option('-learning_rate_decay_after',10,'in number of epochs, when to start decaying the learning rate')
cmd:option('-decay_rate',0.95,'decay rate for rmsprop')
cmd:option('-dropout',0,'dropout for regularization, used after each RNN hidden layer. 0 = no dropout')
cmd:option('-batch_size',50,'number of sequences to train on in parallel')
cmd:option('-max_epochs',50,'number of full passes through the training data')
cmd:option('-grad_clip',5,'clip gradients at this value')
cmd:option('-train_frac',0.95,'fraction of data that goes into train set')
cmd:option('-val_frac',0.05,'fraction of data that goes into validation set')
            -- test_frac will be computed as (1 - train_frac - val_frac)
cmd:option('-init_from', '', 'initialize network parameters from checkpoint at this path')
-- bookkeeping
cmd:option('-seed',123,'torch manual random number generator seed')
cmd:option('-print_every',1,'how many steps/minibatches between printing out the loss')
cmd:option('-eval_val_every',1000,'every how many iterations should we evaluate on validation data?')
cmd:option('-checkpoint_dir', 'cv', 'output directory where checkpoints get written')
cmd:option('-accurate_gpu_timing',0,'set this flag to 1 to get precise timings when using GPU. Might make code bit slower but reports accurate timings.')
-- GPU/CPU
cmd:option('-gpuid',0,'which gpu to use. -1 = use CP')
cmd:option('-opencl',0,'use OpenCL (instead of CUDA)')
cmd:text()

-- parse input params
opt = cmd:parse(arg)
torch.manualSeed(opt.seed)
-- train / val / test split for data, in fractions
local test_frac = math.max(0, 1 - (opt.train_frac + opt.val_frac))
local split_sizes = {opt.train_frac, opt.val_frac, test_frac}

-- initialize cunn/cutorch for training on the GPU and fall back to CPU gracefully
if opt.gpuid >= 0 and opt.opencl == 0 then
    local ok, cunn = pcall(require, 'cunn')
    local ok2, cutorch = pcall(require, 'cutorch')
    if not ok then print('package cunn not found!') end
    if not ok2 then print('package cutorch not found!') end
    if ok and ok2 then
        print('using CUDA on GPU ' .. opt.gpuid .. '...')
        cutorch.setDevice(opt.gpuid + 1) -- note +1 to make it 0 indexed! sigh lua
        cutorch.manualSeed(opt.seed)
    else
        print('If cutorch and cunn are installed, your CUDA toolkit may be improperly configured.')
        print('Check your CUDA toolkit installation, rebuild cutorch and cunn, and try again.')
        print('Falling back on CPU mode')
        opt.gpuid = -1 -- overwrite user setting
    end
end

-- initialize clnn/cltorch for training on the GPU and fall back to CPU gracefully
if opt.gpuid >= 0 and opt.opencl == 1 then
    local ok, cunn = pcall(require, 'clnn')
    local ok2, cutorch = pcall(require, 'cltorch')
    if not ok then print('package clnn not found!') end
    if not ok2 then print('package cltorch not found!') end
    if ok and ok2 then
        print('using OpenCL on GPU ' .. opt.gpuid .. '...')
        cltorch.setDevice(opt.gpuid + 1) -- note +1 to make it 0 indexed! sigh lua
        torch.manualSeed(opt.seed)
    else
        print('If cltorch and clnn are installed, your OpenCL driver may be improperly configured.')
        print('Check your OpenCL driver installation, check output of clinfo command, and try again.')
        print('Falling back on CPU mode')
        opt.gpuid = -1 -- overwrite user setting
    end
end

-- backend
local exec = cudnn
-- threads
torch.setnumthreads(8)

-- Use float for SGD optimization
if opt.optim == 'sgd' then
    torch.setdefaulttensortype('torch.FloatTensor')
end

classes = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10'}
shape = {32, 32}

-- set initial states of hidden units
init_state = {}

local EnNet = nn.Sequential()

local function ConvLayer(units_in, units_out, shape)
    EnNet:add(exec.SpatialConvolution(units_in, units_out, shape[1], shape[2], 1,1, 1,1)) 
    EnNet:add(exec.SpatialBatchNormalization(units_out, 0.001))
    EnNet:add(exec.ReLU(true))
    return EnNet
end

-- create model
ConvLayer(3, 64, {3, 3}):add(nn.Dropout(0.5))
ConvLayer(64,64,{3,3})
EnNet:add(exec.SpatialMaxPooling(2, 2, 2, 2):ceil())

ConvLayer(64, 128, {3, 3}):add(nn.Dropout(0.5))
ConvLayer(128, 128,{3,3})
EnNet:add(exec.SpatialMaxPooling(2, 2, 2, 2):ceil())

ConvLayer(128, 256, {3, 3}):add(nn.Dropout(0.5))
ConvLayer(256, 256, {3, 3}):add(nn.Dropout(0.5))
ConvLayer(256, 256, {3, 3})
EnNet:add(exec.SpatialMaxPooling(2, 2, 2, 2):ceil())

ConvLayer(256, 512, {3, 3}):add(nn.Dropout(0.5))
ConvLayer(512, 512, {3, 3}):add(nn.Dropout(0.5))
ConvLayer(512, 512, {3,3})
EnNet:add(exec.SpatialMaxPooling(2, 2, 2, 2):ceil())

-- the kernels and cudnn doesn't handle that, have to use cunn

EnNet:add(nn.View(512))
EnNet:add(nn.Dropout(0.5))
EnNet:add(nn.Linear(512, 512)) 
EnNet:add(nn.BatchNormalization(512))
EnNet:add(nn.ReLU(true))
EnNet:add(nn.Dropout(0.5))
EnNet:add(nn.Linear(512,10))
EnNet:add(nn.LogSoftMax())


local function MSRinit(net)
	local function init(name)
		for k,v in pairs(net:findModules(name)) do
			local n = v.kW*v.kH*v.nOutputPlane
			v.weight:normal(0,math.sqrt(2/n))
			v.bias:zero()
		end
	end
  init'cudnn.SpatialConvolution'
  init'nn.SpatialConvolution'
end


MSRinit(EnNet)
print(#EnNet:cuda():forward(torch.CudaTensor(16,3,32,32)))
return EnNet

