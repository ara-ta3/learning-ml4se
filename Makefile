.PHONY: requirements.txt

run: env/bin/jupyter
	$< notebook

git-submodule:
	git submodule init
	git submodule update

env/bin/jupyter: requirements.txt

requirements.txt: env/bin/pip
	$< install -r $@

env/bin/pip: env/bin

env/bin:
	virtualenv -p python3 env

clean:
	rm -rf env
	mkdir -p env
