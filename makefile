PORT       :=4458

build:
	docker build . --tag=tg

run:
	docker run -ti --rm \
	  -v $$HOME/.telegram-cli:/root/.telegram-cli \
	  tg

run-bot:
	docker run -ti --rm \
	  -v $$HOME/.telegram-cli:/root/.telegram-cli \
	  -p $(PORT):$(PORT) \
	  tg \
	  --tcp-port $(PORT) --accept-any-tcp \
	  --json --disable-link-preview \
	  --disable-colors --wait-dialog-list

login:
	docker run -ti --rm \
	  -v $$HOME/.telegram-cli:/root/.telegram-cli \
	  --entrypoint="/bin/ash" \
	  tg 
