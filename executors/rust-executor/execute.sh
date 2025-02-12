#!/bin/sh
echo "$CODE" > main.rs
rustc main.rs -o main
./main
