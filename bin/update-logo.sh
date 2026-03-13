#!/bin/bash

# Navigate to repository root (script is in bin/)
cd "$(dirname "$0")/.." || exit 1

# Configuration
SOURCE_SVG="assets/img/logo-rsec.svg"
OUTPUT_DIR="assets/img"

# Check dependencies
if ! command -v rsvg-convert &> /dev/null; then
    echo "Error: rsvg-convert not found. Install with:"
    echo "  sudo apt-get install librsvg2-bin"
    exit 1
fi

if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick not found. Install with:"
    echo "  sudo apt-get install imagemagick"
    exit 1
fi

if [ ! -f "$SOURCE_SVG" ]; then
    echo "Error: Source SVG not found at $SOURCE_SVG"
    exit 1
fi

echo "Generating favicons from $SOURCE_SVG..."

# Generate PNG favicons
rsvg-convert -w 16 -h 16 "$SOURCE_SVG" > "$OUTPUT_DIR/favicon-16x16.png"
echo "✓ favicon-16x16.png"

rsvg-convert -w 32 -h 32 "$SOURCE_SVG" > "$OUTPUT_DIR/favicon-32x32.png"
echo "✓ favicon-32x32.png"

rsvg-convert -w 180 -h 180 "$SOURCE_SVG" > "$OUTPUT_DIR/apple-touch-icon.png"
echo "✓ apple-touch-icon.png"

rsvg-convert -w 192 -h 192 "$SOURCE_SVG" > "$OUTPUT_DIR/android-chrome-192x192.png"
echo "✓ android-chrome-192x192.png"

rsvg-convert -w 512 -h 512 "$SOURCE_SVG" > "$OUTPUT_DIR/android-chrome-512x512.png"
echo "✓ android-chrome-512x512.png"

rsvg-convert -w 150 -h 150 "$SOURCE_SVG" > "$OUTPUT_DIR/mstile-150x150.png"
echo "✓ mstile-150x150.png"

# Create multi-resolution ICO file
convert "$OUTPUT_DIR/favicon-16x16.png" "$OUTPUT_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon.ico"
echo "✓ favicon.ico"

# Create Safari pinned tab icon (black silhouette)
sed 's/fill="[^"]*"/fill="#000000"/g; s/stroke="[^"]*"/stroke="#000000"/g' "$SOURCE_SVG" > "$OUTPUT_DIR/safari-pinned-tab.svg"
echo "✓ safari-pinned-tab.svg"

echo ""
echo "All favicons saved to $OUTPUT_DIR"
echo "Run: git add $OUTPUT_DIR/favicon* $OUTPUT_DIR/apple-touch-icon.png $OUTPUT_DIR/android-chrome*.png $OUTPUT_DIR/mstile-150x150.png $OUTPUT_DIR/safari-pinned-tab.svg"
