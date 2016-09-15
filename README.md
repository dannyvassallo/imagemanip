#Rails 4 Meme Creator

This is a simple implementation of creating a composite using a webcam photo and plain text.

####Getting Started

On first run:

```shell
git clone https://github.com/dannyvassallo/imagemanip && cd imagemanip
bundle install
rake db:migrate
gem install foreman
```

Every other run:

```shell
foreman s #start workers and server
```

Visit `localhost:3000/images` in your browser.
