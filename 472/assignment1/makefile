TARGET = template
<<<<<<< HEAD
HTML = main_html
default: pdf

both: pdf 
=======

default: pdf

>>>>>>> 16310d69af0230d4d11ae76a591c7d80c41d221c
dvi: ${TARGET}.tex
	latex ${TARGET}.tex

ps: dvi
	dvips -R -Poutline -t letter ${TARGET}.dvi -o ${TARGET}.ps

pdf: ps
	ps2pdf ${TARGET}.ps

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

