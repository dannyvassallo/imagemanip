#Rails 4 Meme Creator

This is a simple implementation of creating a composite using a webcam photo and plain text.

####First Run

```shell
git clone https://github.com/dannyvassallo/imagemanip && cd imagemanip
bundle install
rake db:migrate
gem install foreman
```

• Goto `config > application.yml.example`

• Duplicate and rename it to `application.yml`

• Fill out the appropriate information from AWS/S3:

```yaml
#application.yml
AWS_ACCESS_KEY_ID: your credential here
AWS_SECRET_ACCESS_KEY: your credential here
development:
  AWS_BUCKET: your credential here
production:
  AWS_BUCKET: your credential here
```

Save your new `application.yml` with your credentials.

####Starting The App

```shell
foreman s #start workers and server
```

Visit `localhost:3000/images` in your browser.
