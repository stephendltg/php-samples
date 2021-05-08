#!make
PROJECT=epyo
VERSION=v14.16.1
NVM=v0.38.0

install: 
	@echo "Installing project ${PROJECT}..."
	. ${NVM_DIR}/nvm.sh && nvm install ${VERSION} && nvm use ${VERSION}
	npm install

clean:
	@echo "Clean project ${PROJECT}..."
	rm -rf ./node_modules

production:
	@echo "Production project ${PROJECT}..."
	sudo docker-compose up -d

stop-production:
	@echo "Stop production project ${PROJECT}..."
	docker-compose down

staging:
	@echo "Staging project ${PROJECT}..."
	docker-compose -f scripts/docker-compose.dev.yml up -d

stop-staging:
	docker-compose -f scripts/docker-compose.dev.yml down -v
	npm run clean

dev:
	@echo "Dev project ${PROJECT}..."

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM}/install.sh | bash


help: 
	@echo "install: Install ${PROJECT}"
	@echo "production: Start production ${PROJECT}"
	@echo "stop-production: Stop production ${PROJECT}"
	@echo "staging: Start staging ${PROJECT}"
	@echo "stop-staging: Start staging ${PROJECT}"
	@echo "dev: Start dev ${PROJECT}"
	@echo "clean: Clean ${PROJECT}"
	@echo "nvm: NVM install${PROJECT}"
