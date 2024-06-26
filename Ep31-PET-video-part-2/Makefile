
FILES=crtc3 crtc15 crtc16 crtc4
BASIC=crtc14

all: $(FILES) $(BASIC)


$(FILES): %: %.a65
	xa -o $@ $<

$(BASIC): %: %.bas
	petcat -w40 -o $@ $< 
