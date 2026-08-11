FROM alpine:3.22

RUN addgroup -S app && adduser -S -G app app

WORKDIR /app

COPY healthcheck.sh /app/healthcheck.sh

RUN chmod 0555 /app/healthcheck.sh

USER app

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD ["/app/healthcheck.sh"]

CMD ["sh", "-c", "while true; do sleep 3600; done"]
