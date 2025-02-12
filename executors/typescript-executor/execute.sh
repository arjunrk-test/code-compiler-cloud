#!/bin/sh
echo "$CODE" > main.ts
tsc main.ts
node main.js
