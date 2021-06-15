#!make
PROJECT:= $(shell node -p "require('./package.json').name")
NVM=v0.38.0
NODE=v14.16.1

install: 
	@echo "Installing node project ${PROJECT}..."
	. ${NVM_DIR}/nvm.sh && nvm install ${NODE} && nvm use ${NODE}
	npm install

clean:
	@echo "Clean project ${PROJECT}..."
	rm -rf ./node_modules
	sudo rm -rf ./laravel/vendor
	docker-compose down -v

production:
	@echo "Production project ${PROJECT}..."
	docker-compose up -d
	sleep 5
	sh scripts/mariadb_restore.sh

dev:
	@echo "Dev project ${PROJECT}..."
	docker-compose up -d --build
	sleep 5
	npm run migrate
	npm run migrate:seed

stop:
	@echo "Stop production project ${PROJECT}..."
	docker-compose down

destroy:
	docker-compose down -v --rmi all --remove-orphans

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM}/install.sh | bash

svn:
	bash scripts/release.sh


help: 
	@echo "install: Install ${PROJECT}"
	@echo "dev: Start in development ${PROJECT}"
	@echo "production: Start production ${PROJECT}"
	@echo "stop: Stop production ${PROJECT}"
	@echo "destroy: Destroy && delete network && volumes && images${PROJECT}"
	@echo "clean: Clean ${PROJECT}"
	@echo "nvm: NVM install${PROJECT}"
	@echo "svn: Release app${PROJECT}"
