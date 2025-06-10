#!/bin/bash

# Path dasar
BASE_DIR="content/posts"

echo "🛠️  Mengubah draft: false menjadi draft: true..."
find "$BASE_DIR" -type f \( -name "index.en.md" -o -name "index.zh-cn.md" \) | while read -r file; do
  echo "  ➤ Memproses: $file"
  sed -i 's/^draft: false$/draft: true/' "$file"
done

echo ""
echo "🔍 Mengecek apakah masih ada 'draft: false'..."
HAS_FALSE=0

# Cek apakah masih ada draft: false
while read -r file; do
  if grep -q '^draft: false$' "$file"; then
    echo "❌ Masih ditemukan 'draft: false' di: $file"
    HAS_FALSE=1
  fi
done < <(find "$BASE_DIR" -type f \( -name "index.en.md" -o -name "index.zh-cn.md" \))

echo ""
if [ "$HAS_FALSE" -eq 0 ]; then
  echo "✅ Semua file telah berhasil diubah menjadi 'draft: true'."
else
  echo "⚠ Beberapa file masih mengandung 'draft: false'."
fi
