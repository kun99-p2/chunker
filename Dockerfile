FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY chunker.py /app/

CMD ["rq", "worker", "--url", "redis://$REDIS_HOST:$REDIS_PORT/0", "$QUEUE_NAME"]