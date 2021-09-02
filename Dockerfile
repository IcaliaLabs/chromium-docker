FROM debian:bullseye-slim AS runtime-dependencies

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    chromium \
    chromium-driver \
    chromium-sandbox \
    curl \
    fonts-liberation \
    fonts-roboto \
    fonts-noto-color-emoji \
    fonts-noto-cjk \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    fonts-kacst \
    fonts-thai-tlwg \
    fonts-indic \
    gconf-service \
    locales \
    lsb-release \
    unzip \
    wget \
    xvfb \
 && apt-get -qq clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add the chromium user:
ARG CHROMIUM_USER_ID=999
RUN groupadd -r chromium-user && useradd --uid ${CHROMIUM_USER_ID} -r -g chromium-user -G audio,video chromium-user \
  && mkdir -p /home/chromium-user/Downloads \
  && chown -R chromium-user:chromium-user /home/chromium-user

USER ${CHROMIUM_USER_ID}

WORKDIR /workspaces/chromium

ENTRYPOINT [ "/usr/bin/chromium" ]

CMD [ "--headless", "--disable-gpu", "--no-sandbox", "--remote-debugging-port=9222", "--remote-debugging-address=0.0.0.0" ]
