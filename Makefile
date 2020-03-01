PYTHON=python3

.PHONY: venv

run: venv/bin/activate
	. $<; jupyter lab

git/submodule:
	git submodule init
	git submodule update

install: venv/bin/activate git/submodule
	. $<; pip install -r requirements.txt
	. $<; jupyter labextension install @krassowski/jupyterlab-lsp

venv/bin/activate:
	$(PYTHON) -m venv venv

clean:
	rm -rf venv
