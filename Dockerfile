#
# Builder
#
FROM caddy:builder as builder

ARG version="0.11.0"
ARG plugins=""

RUN VERSION=${version} PLUGINS=${plugins} /bin/sh /usr/bin/builder.sh

#
# Final stage
#
FROM alpine:3.7
LABEL maintainer "Mephis Pheies <mephistommm@gmail.com>"

ARG version="0.11.0"
LABEL caddy_version="$version"

RUN apk add --no-cache openssh-client git

# install caddy
COPY --from=builder /install/caddy /usr/bin/caddy

# validate install
RUN /usr/bin/caddy -version
RUN /usr/bin/caddy -plugins

RUN mkdir /root/caddy

EXPOSE 80 443 2018
VOLUME /root/.caddy /root/caddy /srv
WORKDIR /srv

COPY Caddyfile /root/caddy/Caddyfile

ENTRYPOINT ["caddy"]
CMD ["--conf", "/root/caddy/Caddyfile", "--log", "stdout", "--agree=false"]
