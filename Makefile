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

clean-build:
	-rm *.log *.aux

pwoolcoc-resume.pdf: $(RESUME).tex
	pdflatex -jobname $* $<

pwoolcoc-cover.pdf: $(COVER).tex
	pdflatex -jobname $* $<

resume-with-cover: package.tex pwoolcoc-resume.pdf pwoolcoc-cover.pdf
	pdflatex -jobname $(FINAL) $<
	$(MAKE) clean-build

resume-no-cover: package.tex pwoolcoc-resume.pdf
	pdflatex -jobname $(FINAL) $<
	$(MAKE) clean-build

resume: resume-no-cover

open:
	$(VIEWER) $(RESUME).pdf

