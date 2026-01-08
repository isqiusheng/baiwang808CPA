FROM YOUR_CPA_IMAGE:TAG

# 如果你的 CPA 镜像是 debian/ubuntu 系：
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl unzip supervisor gettext-base \
  && rm -rf /var/lib/apt/lists/*

ARG XRAY_VERSION=1.8.13
RUN curl -fsSL -o /tmp/xray.zip \
      "https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip" \
  && unzip /tmp/xray.zip -d /tmp/xray \
  && install -m 0755 /tmp/xray/xray /usr/local/bin/xray \
  && rm -rf /tmp/xray /tmp/xray.zip

# 配置文件
COPY xray.template.json /etc/xray/config.template.json
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 给 Zeabur 一个默认端口（实际运行时 Zeabur 会注入 PORT 覆盖）
ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
