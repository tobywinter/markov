FROM alpine
RUN apk --update upgrade && apk add curl ca-certificates && \
    update-ca-certificates && rm -rf /var/cache/apk/*

ADD . /markov
ADD ./markovbot /markovbot
