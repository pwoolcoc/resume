RESUME := resume

# Change this for your PDF viewer
VIEWER := $(shell which evince || which zathura)

all: resume.html resume.pdf resume.docx resume.txt

clean:
	rm *.pdf
	rm *.html
	rm *.docx
	rm *.txt

resume.html: $(RESUME).markdown
	pandoc -c css/resume.css --standalone --from markdown --to html -o $@ $<

resume.pdf: $(RESUME).markdown
	pandoc --standalone --from markdown --to latex -o $@ $<

resume.docx: $(RESUME).markdown
	pandoc --from markdown --to docx -o $@ $<

resume.txt: $(RESUME).markdown
	pandoc --standalone --smart --from markdown --to plain -o $@ $<

open:
	$(VIEWER) $(RESUME).pdf

.PHONY: clean
