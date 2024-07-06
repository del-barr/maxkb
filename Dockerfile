# 使用已有的 1panel/maxkb 镜像作为基础镜像
FROM 1panel/maxkb

# 将本地的 maxkb 数据库文件夹挂载到容器中的 /var/lib/postgresql/data
VOLUME ["/var/lib/postgresql/data"]

# 暴露端口 8080
EXPOSE 8080

# 添加健康检查
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:8080 || exit 1

# 运行 PostgreSQL 服务并监听8080端口
CMD ["sh", "-c", "service postgresql start && postgres -D /var/lib/postgresql/data -p 8080"]
