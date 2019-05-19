FROM python:3.5-jessie AS build-env
ADD . /app
WORKDIR /app

RUN pip3 install --upgrade pip
RUN pip install -r ./requirements.txt

FROM gcr.io/distroless/python3
COPY --from=build-env /app /app
COPY --from=build-env /usr/local/lib/python3.5/site-packages /usr/local/lib/python3.5/site-packages

WORKDIR /app
ENV PYTHONPATH=/usr/local/lib/python3.5/site-packages
ENTRYPOINT ["python", "incrementer.py"]
