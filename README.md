# README

* This is a spike to explore video structural metadata approaches.

* **N.B.** you will need to set the following environment variables
    when running this app:
```ruby
HTTP_USER
HTTP_PASSWORD
SECRET_TOKEN
```

    e.g., for **Heroku** deployments:
```bash
$ heroku config:set SECRET_TOKEN=$(rake secret)
$ heroku config:add HTTP_USER='xxxxxxx' HTTP_PASSWORD='yyyyyyy'
```

    e.g., for **local** deployments:
```bash
export SECRET_TOKEN=$(rake secret)
export HTTP_USER='foo' 
export HTTP_PASSWORD='bar'
```
