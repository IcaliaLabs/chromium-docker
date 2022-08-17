FROM alpine:3.16.2

RUN apk add --no-cache \
   ca-certificates \
   chromium \
   chromium-swiftshader \
   font-croscore \
   font-noto-cjk \
   font-noto-emoji \
   ttf-dejavu \
   ttf-liberation \
   ttf-opensans

# Add the chromium user:
ARG CHROMIUM_USER_ID=1000
RUN getent passwd "${CHROMIUM_USER_ID}" || \
  adduser -D -H -u ${CHROMIUM_USER_ID} -h /usr/src -g "Chromium User,,," chromium-user

USER ${CHROMIUM_USER_ID}

WORKDIR /workspaces/chromium

ENTRYPOINT [ "/usr/bin/chromium-browser" ]

CMD [ "--headless", "--disable-gpu", "--no-sandbox", "--remote-debugging-port=9222", "--remote-debugging-address=0.0.0.0" ]
