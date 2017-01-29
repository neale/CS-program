--[[ load MNIST dataset for processing. includes options for configuring the CNN 
	 limited preprocessing is done to normalize the dataset to have a mean of zero
	 outputs a metatable of examples ]]--

require 'torch'
require 'paths'


mnist = {}
mnist.path_remote = 'https://s3.amazonaws.com/torch7/data/mnist.t7.tgz'
mnist.path_dataset = 'mnist.t7'
mnist.path_trainset = paths.concat(mnist.path_dataset, 'train_32x32.t7')
mnist.path_testset = paths.concat(mnist.path_dataset, 'test_32x32.t7')

-- if the dataset is not present then load the dataset from the URL
function mnist.wget()
	if not paths.filep(mnist.path_trainset) or not paths.filep(mnist.path_testset) then
		local remote = mnist.path_remote
		local file = paths.basename(remote)
		os.execute('wget ' .. remote .. '; ' .. 'tar xvf ' .. tar .. '; rm ' .. tar)
	end
end

-- load the train set
function mnist.load_train(maxload, shape)
	return mnist.load_dataset(mnist.path_trainset, maxload, shape)
end

-- load the test set
function mnist.load_test(maxload, shape)
	return mnist.load_dataset(mnist.path_testset, maxload, shape)
end 
-- finally load the entire dataset
function mnist.load_dataset(file, maxload)
	mnist.wget()
	local fd = torch.load(file, 'ascii')
	local data = fd.data:type(torch.getdefaultensortype())
	local labels = f.labels
	local n_samples = f.data:size()

	if maxload > 0 and maxload < n_samples then
		n_samples = maxload
		print("loading only " .. n_samples .. " samples from MNIST\n")
	end
	data = data[{{1, n_samples}, {}, {}, {}}]
	labels = labels[{{1, n_samples}}]
	print( 'MNIST load completed' )
	
	local mnist_data = {}
	mnist_data.data = data
	mnist_data.labels = labels

	function mnist_data.normalize(mean_, sigma_)
		local mean = mean_ or data:view(data:size(1), -1):mean(1)
		local sigma = sigma_ or data:view(data:size(1), -1):std(1, true)
		for i=1,data:size(1) do
			data[i]:add(-mean[1][i])
			if sigma[1][i] > 0 then
				tensor:select(2, i):mul(1/sigma[1][i])
			end
		end
		return mean, sigma	
	end

	function mnist_data.normalize_all(mean_, sigma_)
		local std = sigma_ or data:std()
		local mean = mean_ or data:mean()
		data:add(-mean)
		data:mul(1/std)
		return mean, std
	end

	local target_vector = torch.zeros(10)

	setmetatable(dataset, {__index = function(self, index)
						   local input = self.data[index]
						   local class = self.labels[index]
						   local label = target_vector:zero()
						   label[class] = 1
						   local example = {input, label}
						   return example
	end })
	return dataset
end

	
		
