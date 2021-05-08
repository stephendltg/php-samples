#!make
PROJECT=yoonest
NVM=v0.38.0

install: 
	@echo "Installing node project ${PROJECT}..."
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

destroy-production:
	docker-compose down -v --rmi all --remove-orphans

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM}/install.sh | bash

svn:
	bash scripts/release.sh


help: 
	@echo "install: Install ${PROJECT}"
	@echo "production: Start production ${PROJECT}"
	@echo "stop-production: Stop production ${PROJECT}"
	@echo "destroy-production: Stop production && delete network && volumes && images${PROJECT}"
	@echo "clean: Clean ${PROJECT}"
	@echo "nvm: NVM install${PROJECT}"
