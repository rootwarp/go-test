test:
	@echo Unittest.
	go test -v

coverage:
	@echo Code coverage
	go test ./... -coverprofile cover.out
