#!/usr/bin/env bash

# Make sure dependencies exist
check_deps() {
    for cmd in identify exiftool heif-convert; do
        if ! command -v $cmd &>/dev/null; then
            echo "⚠ Missing dependency: $cmd"
        fi
    done
}

clear
echo "=============================="
echo "     📸 Image Utility Tool"
echo "=============================="
echo ""

# Ask for file
read -e -p "Enter image file path: " file

if [ ! -f "$file" ]; then
    echo "❌ File does not exist: $file"
    exit 1
fi

while true; do
    echo ""
    echo "Select an action:"
    echo "  1) Show image dimensions"
    echo "  2) Show FULL EXIF metadata"
    echo "  3) Show device (Make/Model)"
    echo "  4) Convert HEIC → JPG"
    echo "  5) Show ALL info"
    echo "  6) Quit"
    echo ""

    read -p "Choose 1-6: " choice
    echo ""

    case "$choice" in
        1)
            echo "📏 Dimensions:"
            identify -format "%wx%h\n" "$file"
            ;;
        2)
            echo "📸 Full EXIF metadata:"
            exiftool "$file"
            ;;
        3)
            echo "📱 Camera / Device Info:"
            exiftool "$file" | grep -E "Make|Model|Device"
            ;;
        4)
            echo "🔄 Converting HEIC → JPG..."
            out="${file%.*}.jpg"
            heif-convert "$file" "$out"
            echo "Done: $out"
            ;;
        5)
            echo "📏 Dimensions:"
            identify -format "%wx%h\n" "$file"
            echo ""

            echo "📱 Camera / Device Info:"
            exiftool "$file" | grep -E "Make|Model|Device"
            echo ""

            echo "📸 Key EXIF summary:"
            exiftool "$file" | grep -E "ISO|Shutter|Aperture|F-Number|Date|GPS"
            ;;
        6)
            echo "👋 Exiting."
            exit 0
            ;;
        *)
            echo "❌ Invalid choice. Try again."
            ;;
    esac
done

