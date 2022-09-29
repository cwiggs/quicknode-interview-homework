From docker.io/library/golang:1.13-alpine

RUN mkdir /app
COPY ../app /app
WORKDIR /app
RUN ls -l /app
RUN go build -o server .

CMD [ "/app/server" ]
