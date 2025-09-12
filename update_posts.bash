#!/bin/bash

for POST in $(ls -1 posts/????/??/??/*.md); do
  antenna post posts.md "${POST}"
done
