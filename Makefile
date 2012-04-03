all: resume.pdf
.PHONY: clean

FILE=pwoolcoc-resume
JOB=resume

open:

clean: $(JOB).log $(JOB).pdf
	test -f $(JOB).log && rm $(JOB).log
	test -f $(JOB).pdf && rm $(JOB).pdf

resume.pdf: $(FILE).tex
	pdflatex -jobname $(JOB) $<

