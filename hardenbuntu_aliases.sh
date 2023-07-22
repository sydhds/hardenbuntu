alias hbu_update="type hbu_update; sudo apt update && sudo apt upgrade \
    && sudo snap refresh \
    && sudo fwupdmgr refresh --force \
    && sudo fwupdmgr get-updates --json \
    && sudo fwupdmgr update"
alias hbu_up='type hbu_up; hbu_update'
alias hbu_chromium='type hbu_chromium; /snap/bin/chromium \
	--js-flags="--jitless" \
	--ozone-platform=wayland \
	--enable-strict-mixed-content-checking \
	--enable-strict-powerful-feature-restrictions \
	--site-per-process \
  --disable-3d-apis \
	--disable-gpu \
 	--disable-webgl \
	--disable-webgl2 \
  --disable-accelerated-2d-canvas \
  --no-vr-runtime \
  --disable-speech \
  --disable-speech-api \
  --disable-dinosaur-easter-egg \
  '
alias hbu_chromium_paranoid='type hbu_chromium_paranoid; /snap/bin/chromium \
	--js-flags="--jitless" \
	--ozone-platform=wayland \
	--enable-strict-mixed-content-checking \
	--enable-strict-powerful-feature-restrictions \
	--site-per-process \
  --disable-3d-apis \
	--disable-gpu \
 	--disable-webgl \
	--disable-webgl2 \
  --disable-accelerated-2d-canvas \
  --no-vr-runtime \
  --disable-speech \
  --disable-speech-api \
  --disable-dinosaur-easter-egg \
	--disable-webrtc-hw-encoding \
	--disable-webrtc-hw-decoding \
	--enable-potentially-annoying-security-features \
  --disable-accelerated-video-decode \
  --disable-file-system \
  --disable-reading-from-canvas \
  --disable-background-networking \
  '