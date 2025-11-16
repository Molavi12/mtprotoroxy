FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y curl python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# نصب MTProto Proxy
RUN curl -L https://github.com/TelegramMessenger/MTProxy/archive/master.tar.gz -o mtproxy.tar.gz && \
    tar -xzf mtproxy.tar.gz && \
    cd MTProxy-master && \
    make

COPY mtproxy.conf /etc/mtproxy.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 443 80

CMD ["/start.sh"]
