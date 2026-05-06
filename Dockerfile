FROM eclipse-temurin:21-jre

WORKDIR /server

RUN apt-get update && apt-get install -y \
    curl jq wget unzip \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 25565

ENTRYPOINT ["/entrypoint.sh"]
