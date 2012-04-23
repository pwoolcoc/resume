all: resume

.PHONY: clean
.SUFFIXES: .pdf

RESUME=pwoolcoc-resume
COVER=pwoolcoc-cover

open:

clean:
	rm *.pdf


pwoolcoc-resume.pdf: $(RESUME).tex
	pdflatex -jobname $* $<

pwoolcoc-cover.pdf: $(COVER).tex
	pdflatex -jobname $* $<

Paul-Woolcock-Resume.pdf: package.tex pwoolcoc-resume.pdf pwoolcoc-cover.pdf
	pdflatex -jobname $* $<
	rm *.log *.aux

resume: Paul-Woolcock-Resume.pdf
	open $<


