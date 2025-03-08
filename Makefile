# Define the Markdown files and the corresponding HTML files
MD_FILES := $(wildcard *.md)
HTML_FILES := $(MD_FILES:.md=.html)

# Default target
all: $(HTML_FILES)

# Rule to convert Markdown to HTML
%.html: %.md
	pandoc $< -o $@

# Clean up generated HTML files
clean:
	rm -f $(HTML_FILES)

status:
	git status

save:
	@if [ "$(msg)" != "" ]; then git commit -am "$(msg)"; else git commit -am "Quick Save"; fi
	git push origin $(BRANCH)

refresh:
	git fetch origin
	git pull origin $(BRANCH)


