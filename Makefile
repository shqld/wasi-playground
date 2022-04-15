BIN_NAME := wasi-playground

NATIVE_BIN := ./target/release/$(BIN_NAME)
WASM_BIN := ./target/wasm32-wasi/release/$(BIN_NAME).wasm

WARMUP := 100

benchmark: $(NATIVE_BIN) $(WASM_BIN)
	hyperfine --warmup $(WARMUP) '$(NATIVE_BIN)' 'wasmtime $(WASM_BIN)'

run_native: $(NATIVE_BIN)
	time $(NATIVE_BIN)

run_wasm: $(WASM_BIN)
	time wasmtime $(WASM_BIN)

$(NATIVE_BIN): src/*
	cargo build --release

$(WASM_BIN): src/*
	cargo build --target wasm32-wasi --release
