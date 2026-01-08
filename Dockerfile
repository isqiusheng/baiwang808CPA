FROM eceasy/cli-proxy-api:latest

# 这个镜像是 Alpine 系（能用 apk 的概率很高）；如果你构建时报 apk 不存在，再告诉我我给你 Debian 版。
RUN apk add --no-cache ca-certificates curl unzip supervisor gettext

# 安装 xray（二进制）
ARG XRAY_VERSION=1.8.13
RUN curl -fsSL -o /tmp/xray.zip \
      "https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip" \
  && unzip /tmp/xray.zip -d /tmp/xray \
  && install -m 0755 /tmp/xray/xray /usr/local/bin/xray \
  && rm -rf /tmp/xray /tmp/xray.zip

COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
COPY xray.json.tpl /etc/xray/config.json.tpl
COPY config.yaml.tpl /CLIProxyAPI/config.yaml.tpl

RUN chmod +x /entrypoint.sh

# 对外只需要暴露 CLIProxyAPI 的端口（Zeabur 的 PORT 会注入，CLIProxyAPI 会监听它）
EXPOSE 8317

ENTRYPOINT ["/entrypoint.sh"]
