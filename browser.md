### Browser

Recommended browser: chromium

Ref: https://madaidans-insecurities.github.io/firefox-chromium.html

Every release of chromium have several bug fix. Switching chromium to candidate channel is a good way to get fast update: 

    sudo snap refresh chromium --candidate
    
Ref: https://divestos.org/misc/ch-dates.txt    

TODO: explore if build is properly done & snap sandbox

### Hardening flags

Ref:
* https://peter.sh/experiments/chromium-command-line-switches/

#### Disable jit

    /snap/bin/chromium --js-flags="--jitless"

Issue:
* Compatibility: disable Wasm
* Performance: slight performance decrease

Ref:
* https://v8.dev/blog/jitless
* https://wonderfall.space/just-in-time/

### Others flags

* Hardening:
  * --enable-potentially-annoying-security-features
  * --enable-strict-mixed-content-checking
  * --enable-strict-powerful-feature-restrictions
  * --site-per-process

* Disable access to gpu:
  * --disable-gpu 
  * --disable-webgl 
  * --disable-webgl2   

TODO: add more flags && add ref about why disabling gpu access

### Privacy

#### Extensions

Available on https://chrome.google.com/webstore/category/extensions

* ublock origin: an efficient ad blocker
* Decentraleyes: protect against tracking
  * test: https://decentraleyes.org/test/
* ClearURL: remove tracking elements from URLs


