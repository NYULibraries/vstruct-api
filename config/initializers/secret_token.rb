# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# TODO:store in environment variable and generate new secret_key_base.
VstructApi::Application.config.secret_key_base = '5ac52e5a9369817ebc4c69518e07fbb80e1bc7534143273ac2ad6ebd7525195f0725d956d980b5e30640e9577c1d509a9992b720acb181ab2cde1956d1800fcc'
