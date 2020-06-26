# Epicery test technique

## Instructions

The instructions can be found [here](./INSTRUCTIONS.md).

## Getting started

### Ruby version

2.7.1

### System dependencies

- docker
- (optional) dip.yml

### First step

Run the following command to setup the docker container, and setup rails.

```bash
dip provision
```

### Deployment instructions

```bash
dip rails s
```

### Seeding data

```bash
dip rails db:seed
```

### How to run the test suite

```bash
dip rspec
```

### Opening the Bash shell in the container

```bash
dip sh
```

## Implementation

### Gems

- rspec & shoulda-matchers for testing

### Comments

- I used the [Ruby on Whales](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development) guide by [Evil Martians](https://evilmartians.com/) to dockerize my app. I also used the [dip.yml](https://github.com/evilmartians/terraforming-rails/blob/master/examples/dockerdev/dip.yml) tool that they recommend.

- I updated ruby, bundler and the gems.

- I opted for the ruby-alpine image to limit the size (thank you for also using SQLite as a database as it simplifies the deployment).

- I tested the shop associations using RSpec, and made sure that the requests to the shop controller actions were working.

- I wrote a script to automatically seed data, including some where there were more than 4 products per taxon so that the _show more_ element would appear. If you're lucky, you should also see that some shops are hidden, and that some shops have no products.
