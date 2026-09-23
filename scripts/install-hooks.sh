#!/bin/bash
# Installs Syzygy org pre-push hook into .git/hooks/
set -e
HOOKS_DIR="$(git rev-parse --git-dir)/hooks"
mkdir -p "$HOOKS_DIR"
cat > "$HOOKS_DIR/pre-push" << 'EOF'
#!/bin/bash
# Syzygy AI Flutter — pre-push hook
# Runs dart analyze before allowing push
echo "Running dart analyze before push..."
dart analyze 2>&1
if [ $? -ne 0 ]; then
  echo "Analysis failed — push blocked."
  exit 1
fi
echo "Analysis passed."
EOF
chmod +x "$HOOKS_DIR/pre-push"
echo "Pre-push hook installed successfully."
