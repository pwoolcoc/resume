INPUT := source
OUTPUT := resume

ROOTDIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
OUTDIR ?= $(PWD)/build

# Change this for your PDF viewer
VIEWER := $(shell which evince || which zathura || which open)

all: $(OUTDIR)/resume.html $(OUTDIR)/resume.pdf $(OUTDIR)/resume.docx $(OUTDIR)/resume.txt

$(OUTDIR):
	mkdir -p $(OUTDIR)

# Avoid removing the source files
clean:
	[[ "$(ROOTDIR)" != "$(abspath $(OUTDIR))" ]] && rm -rf $(OUTDIR) || exit 0

$(OUTDIR)/resume.html: $(INPUT).markdown $(OUTDIR)
	pandoc -c css/resume.css --standalone --from markdown --to html -o $@ $<

$(OUTDIR)/resume.pdf: $(INPUT).markdown $(OUTDIR)
	pandoc --standalone --from markdown --to latex -o $@ $<

$(OUTDIR)/resume.docx: $(INPUT).markdown $(OUTDIR)
	pandoc --from markdown --to docx -o $@ $<

$(OUTDIR)/resume.txt: $(INPUT).markdown $(OUTDIR)
	pandoc --standalone --from markdown+smart --to plain -o $@ $<

open: $(OUTDIR)/$(OUTPUT).pdf
	$(VIEWER) $(OUTDIR)/$(OUTPUT).pdf

.PHONY: clean
