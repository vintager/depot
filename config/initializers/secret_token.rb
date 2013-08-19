# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# Depot::Application.config.secret_key_base = '195ddf2f78f84b60089b0b7f87af3442e07bbb78ffcfb01ecb6e9e655c471475601a37b940e1709b65c3c8f680ff5acafdcbe0d2836c63a93f5b6d3428e8f00b'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Depot::Application.config.secret_key_base = secure_token
