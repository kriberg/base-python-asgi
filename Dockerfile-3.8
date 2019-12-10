FROM quay.io/evryfs/base-python:3.8
ARG UVICORN_VERSION=0.10.8
ARG BUILD_DATE
ARG BUILD_URL
ARG GIT_URL
ARG GIT_COMMIT
ARG PY_VER
LABEL maintainer="Kristian Berg <kristian.berg@evry.com>" \
      org.opencontainers.image.title="base-python-asgi" \
      org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.authors="Kristian Berg <kristian.berg@evry.com>" \
      org.opencontainers.image.url=$BUILD_URL \
      org.opencontainers.image.documentation="https://github.com/evryfs/base-python-asgi/" \
      org.opencontainers.image.source=$GIT_URL \
      org.opencontainers.image.version=$PY_VER-$UVICORN_VERSION \
      org.opencontainers.image.revision=$GIT_COMMIT \
      org.opencontainers.image.vendor="EVRY Financial Services" \
      org.opencontainers.image.licenses="proprietary-license" \
      org.opencontainers.image.description="Base image for python $PY_VER with uvicorn ASGI server"

ENV UVICORN_PORT 8000
ENV UVICORN_HOST 0.0.0.0
USER root
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gcc
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl
RUN pip install uvicorn==$UVICORN_VERSION
RUN apt-get purge -y gcc && rm -rf /var/lib/apt/lists/*
COPY start_uvicorn /bin/
COPY asgi.py /usr/local/lib/python$PY_VER/site-packages/
RUN chmod 755 /bin/start_uvicorn
USER 1001:100
WORKDIR /app
EXPOSE $UVICORN_PORT
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD curl -I --silent --fail "http://localhost:$UVICORN_PORT/" || exit 1
ENTRYPOINT ["/bin/start_uvicorn"]
CMD ["asgi:app"]
