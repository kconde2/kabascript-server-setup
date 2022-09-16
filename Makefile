idt:
	docker-compose exec ansible ansible-playbook server.yml --tags="mysql, pma"
iall:
	docker-compose exec ansible ansible-playbook server.yml
up:
	docker-compose up -d --build
down:
	docker-compose down
bash:
	docker-compose exec ansible bash
restart: down up
provision:
	# docker-compose exec ansible ansible-playbook provision.yml -e env=server --tags="init, reverse-proxy, db, netdata, portainer" -v
	docker-compose exec ansible ansible-playbook provision.yml -e env=server --tags="db" -v
