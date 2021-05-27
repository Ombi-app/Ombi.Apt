FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive HOME=$GITHUB_HOME

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        ca-certificates \
        curl \
        debhelper \
        dpkg \
        gnupg2 && \
    curl -sSL https://www.aptly.info/pubkey.txt | apt-key add - && \
    echo "deb http://repo.aptly.info/ squeeze main" | tee /etc/apt/sources.list.d/aptly.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        aptly

COPY /entrypoint.sh /entrypoint.sh
COPY /clean.sh /clean.sh

RUN chmod +x /entrypoint.sh /clean.sh

ENTRYPOINT ["/entrypoint.sh"]