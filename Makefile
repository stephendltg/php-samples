#!make
PROJECT=yoonest
VERSION=v14.16.1
NVM=v0.38.0

install: 
	@echo "Installing project ${PROJECT}..."
	. ${NVM_DIR}/nvm.sh && nvm install ${VERSION} && nvm use ${VERSION}
	npm install

clean:
	@echo "Clean project ${PROJECT}..."
	rm -rf ./node_modules
	docker-compose down -v

production:
	@echo "Production project ${PROJECT}..."
	docker-compose up -d

stop-production:
	@echo "Stop production project ${PROJECT}..."
	docker-compose down

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM}/install.sh | bash

svn:
	bash scripts/release.sh


help: 
	@echo "install: Install ${PROJECT}"
	@echo "production: Start production ${PROJECT}"
	@echo "stop-production: Stop production ${PROJECT}"
	@echo "clean: Clean ${PROJECT}"
	@echo "nvm: NVM install${PROJECT}"
