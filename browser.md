### Browser

Recommended browser: chromium

Ref: https://madaidans-insecurities.github.io/firefox-chromium.html

Every release of chromium have several bug fix. Switching chromium to candidate channel is a good way to get fast update: 

    sudo snap refresh chromium --candidate
    
Ref: https://divestos.org/misc/ch-dates.txt    

Note: hardenbuntu_aliases.sh file provides 2 alias for chromium:
* hbu_chromium
* hbu_chromium_paranoid

### Chromium flags documentation

* https://peter.sh/experiments/chromium-command-line-switches/

#### Disable jit

    /snap/bin/chromium --js-flags="--jitless"

Issue:
* Compatibility: disable Wasm
* Performance: slight performance decrease

Ref:
* https://v8.dev/blog/jitless
* https://wonderfall.space/just-in-time/

### Other flags

* Hardening:
  * --enable-potentially-annoying-security-features
  * --enable-strict-mixed-content-checking
  * --enable-strict-powerful-feature-restrictions
  * --site-per-process

Note: The flag '--enable-potentially-annoying-security-features' can break some video streaming player.

* Disable access to gpu (unless you visit some site with webgl (e.g. [shadertoy](https://www.shadertoy.com/))):
  * --disable-3d-apis 
  * --disable-gpu
  * --disable-webgl 
  * --disable-webgl2
  * --disable-accelerated-2d-canvas

* Disable VR support (unless you want to use a VR headset):
  * --no-vr-runtime

* Disable speech:
  * --disable-speech 
  * --disable-speech-api

* Misc (Reduce surface attack):
  * --disable-dinosaur-easter-egg

Sources: 
* https://git.sr.ht/~seirdy/bwrap-scripts/tree/trunk/item/chromium-sandbox

### Privacy

#### Extensions

Available on https://chrome.google.com/webstore/category/extensions

* [ublock origin](https://chrome.google.com/webstore/detail/ublock-origin): an efficient ad blocker
* [Decentraleyes](https://chrome.google.com/webstore/detail/decentraleyes): protect against tracking
  * test: https://decentraleyes.org/test/
* [ClearURL](https://chrome.google.com/webstore/detail/clearurls): remove tracking elements from URLs


