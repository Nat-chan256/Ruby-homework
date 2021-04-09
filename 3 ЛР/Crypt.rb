module Crypt

    require 'openssl'
    require 'base64'

    class Cryptographer
        private
            attr_writer :key, :iv
            attr_accessor :cipher
        public
            attr_reader :key, :iv

        def initialize(key = nil, iv = nil)
            self.cipher = OpenSSL::Cipher.new 'AES-128-CBC'
            if key == nil then self.key = generateKey else self.key = key end
            self.iv = iv if iv != nil
        end

        def generateKey()
            self.iv = self.cipher.random_iv
            pwd = "some kind of very long password"
            salt = OpenSSL::Random.random_bytes 16
            iter = 20000
            key_len = self.cipher.key_len
            digest = OpenSSL::Digest::SHA256.new
            return OpenSSL::PKCS5.pbkdf2_hmac(pwd, salt, iter, key_len, digest)
        end

        def encrypt(text)
            self.cipher.encrypt
            self.cipher.key = self.key
            self.cipher.iv = self.iv
            encrypted = self.cipher.update text
            encrypted << self.cipher.final
            return Base64.encode64(encrypted).encode('utf-8')
        end

    end

end