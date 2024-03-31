PROJ_DIR=$(realpath .)
TARGET=$(notdir $(realpath .))
SRCS=$(TARGET).md

HTMLS=$(SRCS:.md=.html)

all: $(HTMLS)

%.html: %.md $(PROJ_DIR)/assets/template.html $(PROJ_DIR)/assets/simple-console.xml
	pandoc --template=$(PROJ_DIR)/assets/template.html --syntax-definition=$(PROJ_DIR)/assets/simple-console.xml --highlight-style pygments --toc -f gfm -t html $< -o $@
	@if [ "$(TARGET).md" == "$<" ]; then \
		cp "$(TARGET).html" "index.html"; \
	fi