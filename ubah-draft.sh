#!/bin/bash

# Path dasar
BASE_DIR="content/posts"

# Temukan file index.en.md dan index.zh-cn.md lalu ubah draft: false -> draft: true
find "$BASE_DIR" -type f \( -name "index.en.md" -o -name "index.zh-cn.md" \) | while read -r file; do
  echo "Memproses: $file"
  sed -i 's/^draft: false$/draft: true/' "$file"
done

echo "Selesai mengubah draft: false menjadi draft: true."
