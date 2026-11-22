#!/usr/bin/env bash
# 把 skill 软链接到本机各个 agent 的 skills 目录：Claude Code、Codex、GitHub Copilot、通用 ~/.agents。
# 用法：在仓库根目录执行 scripts/install.sh；已存在同名目录时先备份为 .bak。
set -euo pipefail
SRC="$(cd "$(dirname "$0")/.." && pwd)/skills/presentation-prep"
for dir in "$HOME/.claude/skills" "$HOME/.codex/skills" "$HOME/.copilot/skills" "$HOME/.agents/skills"; do
  mkdir -p "$dir"
  dst="$dir/presentation-prep"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then mv "$dst" "$dst.bak.$(date +%s)"; fi
  ln -sfn "$SRC" "$dst"
  echo "linked $dst -> $SRC"
done
