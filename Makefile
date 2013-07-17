all: resume

.PHONY: clean
.SUFFIXES: .pdf

RESUME=pwoolcoc-resume
COVER=pwoolcoc-cover
FINAL=Paul-Woolcock-Resume

# Change this for your PDF viewer
VIEWER=evince

clean:
	rm *.pdf

pwoolcoc-resume.pdf: $(RESUME).tex
	pdflatex -jobname $* $<

pwoolcoc-cover.pdf: $(COVER).tex
	pdflatex -jobname $* $<

resume: package.tex pwoolcoc-resume.pdf pwoolcoc-cover.pdf
	pdflatex -jobname $(FINAL) $<
	rm *.log *.aux

open:
	$(VIEWER) $(RESUME).pdf

