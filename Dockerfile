# 使用一个基础镜像
FROM node:20-alpine

# 下载git
RUN apk update && \
    apk add --no-cache git && \
    rm -rf /var/cache/apk/*

WORKDIR /app/

# 复制源代码
RUN git clone https://github.com/newq-hole/NewQ-frontend.git .

# 设置工作目录
WORKDIR /app/NewQ-frontend/

# 启用 Corepack
RUN corepack enable

# 复制 package.json 和 yarn.lock 文件到工作目录
COPY package.json yarn.lock ./

# 安装依赖 (使用 yarn)，利用 Docker Cache
RUN yarn install --frozen-lockfile

# 安装依赖 (使用 yarn)
RUN yarn install

# 构建应用程序 (如果需要)
RUN yarn run build

# 定义启动命令
CMD [ "yarn", "start" ]

# (可选) 暴露端口
EXPOSE 3000
