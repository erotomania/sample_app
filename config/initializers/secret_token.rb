# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SamplApp::Application.config.secret_key_base = 'af1ed66161b2a6fa72f82e674b1b47d26310c9f3e558821805ef47217a69ca5fdd08b76312f444d229c83ec115f1a5809401577a55841d1f62bdb73558dd8ecf'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
     #Use the existing token.
     File.read(token_file).chomp
   else
      # Generate a new token and store it in token_file.
      token = SecureRandom.hex(64)
      file.write(token_file, token)
      token
   end
end

SampleApp::Application.config.secret_key_base = secure_token
