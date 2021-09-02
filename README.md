# Chromium 4 Docker

Multi-arch Docker image with Chromium

# Motivation

Inspired by the seminal article ["System of a Test: Proper browser testing on Ruby on Rails"](https://evilmartians.com/chronicles/system-of-a-test-setting-up-end-to-end-rails-testing#dockerizing-system-tests), where they recommend
using the [browserless/chrome](https://github.com/browserless/chrome) image to drive
the system tests...

However, their current image [is not compatible with the arm64 architecture](https://github.com/browserless/chrome/issues/1393) - which
is used on recent Apple computers with Apple Silicon (the M1 chip).

It will take a while for a compatible version to be available, so we made this
image to use it in the interim :)

Just use the `icalialabs/chromium:latest` image instead. Doesn't have all the
bells and whistles as the `browserless/chrome` image, but it will be enough for
driving our system tests :)