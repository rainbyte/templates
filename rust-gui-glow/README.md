# Rust GUI using Glow

This is an OpenGL-based application.

## Requisites

- cargo-web (for web target, `cargo install cargo-web`)
- sdl2 (for window-sdl2 target)

## Instructions

Run on desktop via `glutin` backend:

```sh
cargo run --features=desktop-glutin
```

Run on desktop via `sdl2` backend:

```sh
cargo run --features=desktop-sdl2
```

Run on browser via `stdweb` backend:

```sh
cargo web start --no-default-features --features stdweb --target wasm32-unknown-unknown
```
