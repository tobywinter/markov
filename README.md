# markov

Markov Chains AAS. This is a dead-simple API for either building a markov chain
or for retrieving a string generated by one.

## Markov Chain

See the [wiki entry](http://en.wikipedia.org/wiki/Markov_chain) for an exect
explanation. This program uses a Markov Chain to generate random,
sort-of-but-not-really natural sounding, human readable text. For example, a
Markov Chain seeded with Dante's _Divine Comedy_ might produce some text like
this:

> More than thou thinkest laden are the Heresiarchs, With their disciples of
> all of them,

## Build

    go get -u .
    go build

## Setup

markov requires a running instance of redis in order to work.

    # Describes options which can be passed in, defaults for most are fine
    ./markov -h

    # To actually run it
    ./markov


## Usage

Simply execute the binary, pointing it at a valid redis instance. Once done, the
following endpoints will be exposed:

__/build__

POST'd to in order to add seed data to the chain. This can be called at any
time. It takes in an optional `chainName` argument which can be used to build
independent chains

Example:

    cat some-large-text.txt | curl -XPOST -d@- localhost:8080/build?chainName=twochainz

-----

__/generate__

GET'd in order to retrieve randomly generated text from the markov chain. Takes
a mandatory `numParts` GET argument. Parts are sections of text separated by
some punctation (e.g. `.`, `,`, `!`, `?`, `:`, `;`). Also takes an optional
`chainName` argument to specify which chain to generate off from.

Example:

    curl localhost:8080/generate?numParts=2&chainName=twochainz

Which might give:
> Fraud, wherewithal is every conscience stung,

## Slack bot

There is a bot for slack which I've written which makes use of markov as a
backend. You can find it [here](/markovbot)
