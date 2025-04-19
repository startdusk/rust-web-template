.PHONY: dep
dep:
	pipx install pre-commit

.PHONY: init
init:
	pre-commit install
	cargo deny fetch
	cargo b

.PHONY: test
test:
	@cargo nextest run --all-features --examples

.PHONY: genkey
genkey:
	@openssl genpkey -algorithm ed25519 -out encoding.pem
	@openssl pkey -in encoding.pem -pubout -out decoding.pem
