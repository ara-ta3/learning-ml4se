virtualenv=$(shell which virtualenv)
envdir=./env
requirements=./requirements.txt

all:init install

run:
	$(MAKE) __command command='jupyter notebook'

init:
	test -n $(virtualenv) && $(virtualenv) -p python2.7 $(envdir)

install:
	test -f $(requirements) && $(MAKE) __command command='pip install -r $(requirements)'

__command:
	env PATH=$(envdir)/bin:$(PATH) $(command)
