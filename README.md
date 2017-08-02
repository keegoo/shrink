# shrink

## Introduction

`Shrink` is a URL shorter.

Front-end: ReactJS + Material-UI.

Back-end: Rails + SQLite.

I've created a sample in heroku. Please check: https://shrink-sample.herokuapp.com/.

## Installation

#### Prerequisites

You need to make sure `Ruby` and `NodeJS` was installed.

Here's how I check mine:

    shell$ npm -v
    4.0.5

    shell$ ruby -v
    ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-darwin16]


## Setup

#### get source

`git clone https://github.com/keegoo/shrink`.

#### resolve dependencies

```shell
# UI dependencies
shell$ cd shrink/client
shell$ npm install

# Backend dependencies
shell$ cd shrink/
shell$ bundle install

# build UI
shell$ cd shrink/client
shell$ ./node_modules/.bin/webpack -p

# migrarte DB
shell$ rails db:migrate
```

#### start server

```shell
shell$ cd shrink
shell$ rails s
```

#### done

Open `127.0.0.1:3000` to take a look!


## notes

Type in the `TextField` and click `enter` to have a new shorten URL generated.

Visit `127.0.0.1:3000/<shorten-URL>`, then you'll be redirected to the original URL. The `Visits` in the Dashboard for that URL will increase 1.

Your original URL should be a full one, which means it should begin with `http:// ...`.

The method used to shorten URL is: 1). store original URL into DB; 2) get the ID in the DB table; 3) Convert ID into 62 based. So the IDs from 1 to 62 will simply transfer to single digit number([0..9, a..z, A..Z]).
