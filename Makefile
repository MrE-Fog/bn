default: all

OUT=lib/pure.js

all: $(OUT) $(BROWSER)

$(OUT):
	echo "(function (){ " > $(OUT)
	cat pkg/pre.js | awk ' { print "\t", $$0 } ' >> $(OUT)
	find jsbn/ -type f -name '*.js' | sort | xargs cat | awk '{ print "\t", $$0 }' >> $(OUT)
	cat pkg/post.js | awk ' { print "\t", $$0 } ' >> $(OUT)
	echo "})(this);" >> $(OUT)

build: $(OUT)

clean:
	\rm -rf $(OUT) $(BROWSER) $(TEST_BROWSER)

.PHONY: clean test
