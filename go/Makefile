all: isuumo

isuumo: *.go
	go build -o isuumo

# ↓↓↓当日いじる↓↓↓
BUILD_DIR:=./
BIN_NAME:=isuumo
SERVER1:=isucon-server-1
SERVER_BINARY_DIR:=~/isuumo/webapp/go
SERVER_URL:=localhost:1323

SLOW_LOG_PATH:=/tmp/slow.log
NGINX_ACCESS_LOG_PATH:=/var/log/nginx/access.log

SERVICE_NAME:=isuumo.go.service
# ↑↑↑ここまで↑↑↑

.PHONY: build
build:
	cd $(BUILD_DIR); \
	GOOS=linux GOARCH=amd64 go build -o $(BIN_NAME)


.PHONY: deploy
deploy:
	make build
	ssh $(SERVER1) "sudo systemctl stop $(SERVICE_NAME)"
	scp $(BUILD_DIR)$(BIN_NAME) $(SERVER1):$(SERVER_BINARY_DIR)
	ssh $(SERVER1) "sudo systemctl start $(SERVICE_NAME)"

.PHONY: pprof
pprof:
	go tool pprof -http=":8081" -seconds=20 http://$(SERVER_URL)/debug/pprof/profile

.PHONY: pre-bench
pre-bench:
	ssh $(SERVER1) "truncate $(SLOW_LOG_PATH) --size 0"
	ssh $(SERVER1) "sudo truncate $(NGINX_ACCESS_LOG_PATH) --size 0"

.PHONY: alp
alp:
	ssh $(SERVER1) " alp -r -f $(NGINX_ACCESS_LOG_PATH)"

.PHONY: slow
slow:
	ssh $(SERVER1) "pt-query-digest $(SLOW_LOG_PATH)"ERVER) "sudo systemctl start isucari.golang.service"