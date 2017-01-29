TARGET = template
#CODE = assignment1
#HTML = main_html
default: all

all: pdf code

dvi: ${TARGET}.tex
	latex ${TARGET}.tex
ps: dvi
	dvips -R -Poutline -t letter ${TARGET}.dvi -o ${TARGET}.ps

pdf: ps
	ps2pdf ${TARGET}.ps

#code: ${CODE}.c
#	gcc ${CODE}.c
	

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

