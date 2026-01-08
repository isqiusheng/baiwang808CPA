#!/bin/sh
set -eu

# 让 CLIProxyAPI 监听 Zeabur 的 PORT（Zeabur 会注入 PORT，Dockerfile 部署要求暴露对应端口）:contentReference[oaicite:3]{index=3}
export PORT="${PORT:-8317}"

# 生成 xray 配置（从模板替换环境变量）
mkdir -p /etc/xray
envsubst < /etc/xray/config.json.tpl > /etc/xray/config.json

# 生成 CLIProxyAPI 配置
# CLIProxyAPI 默认读取项目根目录的 config.yaml，docker 示例也常挂载到 /CLIProxyAPI/config.yaml。:contentReference[oaicite:4]{index=4}
envsubst < /CLIProxyAPI/config.yaml.tpl > /CLIProxyAPI/config.yaml

exec /usr/bin/supervisord -c /etc/supervisord.conf
