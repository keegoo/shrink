# shrink

## Introduction

`Shrink` is a URL shorter.

Frontend: ReactJS + Material-UI.

Backend: Rails + Postgresql.

I've created a sample in heroku. Please check: https://shrink-sample.herokuapp.com/.

## Installation

#### Prerequisites

You need to make sure `Ruby` and `NodeJS` was installed.

```shell
~$ node -v
v8.2.1

~$ ruby -v
ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-darwin16]
```

## Setup

#### get source

`git clone https://github.com/keegoo/shrink`.

#### resolve dependencies

```shell
# UI dependencies
~$ cd shrink/client
~$ npm install

# Backend dependencies
~$ cd shrink/
~$ bundle install

# Build UI
~$ cd shrink/client
~$ ./node_modules/.bin/webpack -p

# Migrarte DB
~$ rails db:migrate
```

#### start server

```shell
~$ cd shrink
~$ rails s
```

#### done

Open `127.0.0.1:3000` to take a look!

## notes

Input the URL say http://www.facebook.com in the `TextField`. Then type `enter` in the keyboard. A new shorten URL will be generated.

Visit `127.0.0.1:3000/<shorten-URL>`, then you'll be redirected to the original URL. The `Visits` in the Dashboard for that URL will increase 1.

The method used to shorten URL is: 

1. store original URL into DB.
2. get the ID in the DB table.
3. convert ID into 62 based. So the IDs from 1 to 62 will simply transfer to single digit number([0..9, a..z, A..Z]).
