FROM python:3.12.7-slim-bookworm AS builder

WORKDIR /build

COPY app.py .

FROM python:3.12.7-slim-bookworm

RUN useradd --create-home --uid 10001 appuser

WORKDIR /app

COPY --from=builder /build/app.py .

USER 10001

EXPOSE 8080

CMD ["python", "app.py"]