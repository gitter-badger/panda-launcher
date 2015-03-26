#!/bin/bash

usage() { echo "usage: $0 icon colour [dest_dir]"; exit 1; }

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

devices=android,ios,wp8
eval mkdir -p "$3/res/{icon,screen}/{$devices}"

# Show the user some progress by outputing all commands being run.
set -x

convert="convert -background none"

# Icons for app stores
$convert "$1" -resize 128x128 "$3/res/icon/icon_128x128.png"
$convert "$1" -resize 512x512 "$3/res/icon/icon_512x512.png"
$convert "$1" -resize 1024x1024 "$3/res/icon/icon_1024x1024.png"

# Android
$convert "$1" -resize 36x36 "$3/res/icon/android/ldpi.png"
$convert "$1" -resize 72x72 "$3/res/icon/android/hdpi.png"
$convert "$1" -resize 48x48 "$3/res/icon/android/mdpi.png"
$convert "$1" -resize 96x96 "$3/res/icon/android/xhdpi.png"

# Windows Phone 8
$convert "$1" -resize 99x99 "$3/res/icon/wp8/ApplicationIcon.png"
$convert "$1" -resize 159x159 "$3/res/icon/wp8/Background.png"

# iOS
$convert "$1" -resize 180x180 "$3/res/icon/ios/icon-60@3x.png"
$convert "$1" -resize 60x60 "$3/res/icon/ios/icon-60.png"
$convert "$1" -resize 120x120 "$3/res/icon/ios/icon-60@2x.png"
$convert "$1" -resize 76x76 "$3/res/icon/ios/icon-76.png"
$convert "$1" -resize 152x152 "$3/res/icon/ios/icon-76@2x.png"
$convert "$1" -resize 40x40 "$3/res/icon/ios/icon-40.png"
$convert "$1" -resize 80x80 "$3/res/icon/ios/icon-40@2x.png"
$convert "$1" -resize 57x57 "$3/res/icon/ios/icon.png"
$convert "$1" -resize 114x114 "$3/res/icon/ios/icon@2x.png"
$convert "$1" -resize 72x72 "$3/res/icon/ios/icon-72.png"
$convert "$1" -resize 144x144 "$3/res/icon/ios/icon-72@2x.png"
$convert "$1" -resize 29x29 "$3/res/icon/ios/icon-small.png"
$convert "$1" -resize 58x58 "$3/res/icon/ios/icon-small@2x.png"
$convert "$1" -resize 50x50 "$3/res/icon/ios/icon-50.png"
$convert "$1" -resize 100x100 "$3/res/icon/ios/icon-50@2x.png"

convert="convert $1 -background $2 -gravity center"

# Android
$convert -resize 256x256 -extent 800x480 "$3/res/screen/android/splash-land-hdpi.png"
$convert -resize 128x128 -extent 320x200 "$3/res/screen/android/splash-land-ldpi.png"
$convert -resize 256x256 -extent 480x320 "$3/res/screen/android/splash-land-mdpi.png"
$convert -resize 512x512 -extent 1280x720 "$3/res/screen/android/splash-land-xhdpi.png"
$convert -resize 256x256 -extent 480x800 "$3/res/screen/android/splash-port-hdpi.png"
$convert -resize 128x128 -extent 200x320 "$3/res/screen/android/splash-port-ldpi.png"
$convert -resize 256x256 -extent 320x480 "$3/res/screen/android/splash-port-mdpi.png"
$convert -resize 512x512 -extent 720x1280 "$3/res/screen/android/splash-port-xhdpi.png"

# Windows Phone 8
$convert -resize 256x256 -extent 768x1280 "$3/res/screen/wp8/SplashScreenImage.jpg"

# iOS
$convert -resize 256x256   -extent 320x480 "$3/res/screen/ios/Default~iphone.png"
$convert -resize 512x512   -extent 640x960 "$3/res/screen/ios/Default@2x~iphone.png"
$convert -resize 512x512   -extent 768x1024 "$3/res/screen/ios/Default-Portrait~ipad.png"
$convert -resize 1024x1024 -extent 1536x2048 "$3/res/screen/ios/Default-Portrait@2x~ipad.png"
$convert -resize 512x512   -extent 1024x768 "$3/res/screen/ios/Default-Landscape~ipad.png"
$convert -resize 1024x1024 -extent 2048x1536 "$3/res/screen/ios/Default-Landscape@2x~ipad.png"
$convert -resize 512x512   -extent 640x1136 "$3/res/screen/ios/Default-568h@2x~iphone.png"
$convert -resize 512x512   -extent 750x1334 "$3/res/screen/ios/Default-667h.png"
$convert -resize 1024x1024 -extent 1242x2208 "$3/res/screen/ios/Default-736h.png"
$convert -resize 1024x1024 -extent 2208x1242 "$3/res/screen/ios/Default-Landscape-736h.png"
