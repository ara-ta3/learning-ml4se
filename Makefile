virtualenv=$(shell which virtualenv)
envdir=./env
requirements=./requirements.txt

init:
	test -n $(virtualenv) && $(virtualenv) -p python3 $(envdir)

install:
	test -f $(requirements) && $(MAKE) __command command='pip install -r $(requirements)'

__command:
	env PATH=$(envdir)/bin:$(PATH) $(command)
