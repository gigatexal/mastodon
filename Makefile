.Phony: db db_init redis web

db:
	docker compose up -d db

db_init: db
	docker compose up -d populate_db

redis:
	docker compose up -d redis

web: db db_init redis
	docker compose up -d web

streaming: web
	docker compose up -d streaming
