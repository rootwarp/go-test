test:
	@echo Unittest.
	go test -v

coverage:
	@echo Code coverage
	go test ./... -coverprofile cover.out

build_container:
	gcloud builds submit --tag gcr.io/k8s-pilot-323307/go-test .
