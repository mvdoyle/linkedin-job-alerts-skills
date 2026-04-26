#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./install.sh [target]

Targets:
  default           Install to ~/.claude/skills/
  --project         Install to ./.claude/skills/
  --cursor-user     Install to ~/.cursor/skills/
  --cursor-project  Install to ./.cursor/skills/
EOF
}

case "${1:-}" in
  "")
    TARGET="$HOME/.claude/skills"
    ;;
  --project)
    TARGET="$(pwd)/.claude/skills"
    ;;
  --cursor-user)
    TARGET="$HOME/.cursor/skills"
    ;;
  --cursor-project)
    TARGET="$(pwd)/.cursor/skills"
    ;;
  -h|--help)
    usage
    exit 0
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac

HERE="$(cd "$(dirname "$0")" && pwd)"
SKILLS=(
  linkedin-job-search-router
  linkedin-csharp-job-search
  linkedin-csharp-internship-search
  linkedin-dotnet-job-search
  linkedin-local-dotnet-search
)

mkdir -p "$TARGET"

for skill in "${SKILLS[@]}"; do
  if [[ ! -f "$HERE/$skill/SKILL.md" ]]; then
    echo "Missing skill file: $HERE/$skill/SKILL.md" >&2
    exit 1
  fi

  rm -rf "$TARGET/$skill"
  cp -R "$HERE/$skill" "$TARGET/"
  echo "Installed: $TARGET/$skill"
done

echo "Done. Restart Claude Code or Cursor to pick up newly installed skills."
