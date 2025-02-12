#!/bin/sh
echo "$CODE" > main.swift
swiftc main.swift -o main
./main
