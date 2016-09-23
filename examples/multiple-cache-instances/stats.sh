#! /bin/bash

echo "characters.maggie:1|c" | nc -u -w0 127.0.0.1 8125
echo "characters.lisa:1|c" | nc -u -w0 127.0.0.1 8125
echo "characters.bart:1|c" | nc -u -w0 127.0.0.1 8125
echo "characters.marge:1|c" | nc -u -w0 127.0.0.1 8125
echo "characters.homer:1|c" | nc -u -w0 127.0.0.1 8125
