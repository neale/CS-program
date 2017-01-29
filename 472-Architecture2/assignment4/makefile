TARGET=template
CODE1=endianness
CODE2=cache

default: all

all: endian cache pdf

dvi: ${TARGET}.tex
	latex ${TARGET}.tex

ps: dvi
	dvips -R -Poutline -t letter ${TARGET}.dvi -o ${TARGET}.ps

pdf: ps
	ps2pdf ${TARGET}.ps

endian: ${CODE1}
	/usr/local/common/gcc-4.9.0/bin/gcc -Wall -O0 ${CODE1}.c -o endian -lm -std=c99

cache: ${CODE2}
	gcc ${CODE2}.c -o cache
	
	

clean-dvi:
	rm -f ${TARGET}.aux
	rm -f ${TARGET}.log
	rm -f ${TARGET}.dvi
	rm -f ${TARGET}.out

clean-ps: clean-dvi
	rm -f ${TARGET}.ps

clean-pdf: clean-ps
	rm -f ${TARGET}.pdf


clean: clean-pdf

