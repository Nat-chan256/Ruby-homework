require 'openssl'

cipher = OpenSSL::Cipher::AES256.new(:CBC)

# Generate key
key = OpenSSL::PKey::RSA.new 2048

pass_phrase = 'my secure pass phrase goes here'

key_secure = key.export cipher, pass_phrase

open 'private.secure.pem', 'w' do |io|
  io.write key_secure
end

# Generate iv
iv = cipher.random_iv
open 'iv.txt', 'w' do |io|
  io.write iv
end