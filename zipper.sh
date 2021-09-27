#!/usr/bin/env bash
# XTweak Zipper Script
# Author: LOOPER (iamlooper @ github)
echo "[*] Give me version name. "
read name 
zip -r9T "XCharge_${name}.zip" . -x zipper.sh -x *.git*
echo "[*] Done! "
