build/jenkins-cli: Dockerfile
	DOCKER_BUILDKIT=1 docker build -o build .

.PHONY: try
try: build/jenkins-cli
	time ./build/jenkins-cli -auth $(AUTH) -s $(SERVER) help
