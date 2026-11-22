#!/usr/bin/env bash
# 打包成 Claude Desktop / claude.ai 可上传的 zip：dist/presentation-prep.zip（zip 里是 presentation-prep/SKILL.md 这一层）。
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/dist"; rm -f "$ROOT/dist/presentation-prep.zip"
(cd "$ROOT/skills" && zip -qr "$ROOT/dist/presentation-prep.zip" presentation-prep -x '*.DS_Store')
echo "$ROOT/dist/presentation-prep.zip"
