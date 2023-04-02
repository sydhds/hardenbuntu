alias hbu_up="sudo apt update && sudo apt upgrade \
    && sudo snap refresh \
    && sudo fwupdmgr refresh --force \
    && sudo fwupdmgr get-updates \
    sudo fwupdmgr update"
alias hbu_chromium='/snap/bin/chromium \
	--js-flags="--jitless" \
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
alias hbu_chromium_paranoid='/snap/bin/chromium \
	--js-flags="--jitless" \
	--enable-potentially-annoying-security-features \
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
    --disable-accelerated-video-decode \
    --disable-file-system \
    --disable-reading-from-canvas \
    --disable-background-networking \ 
    '
