LANG = d # 使用する言語
P = A # 実行したい問題


make:
	dmd -of=build/out ${F}

init:
	mkdir -p build
	mkdir -p workspace
	python3 init.py template/main.${LANG} workspace
run:
	dmd -run workspace/${P}.d
clean:
	rm build/*
