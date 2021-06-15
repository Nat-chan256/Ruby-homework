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
            self.cipher = OpenSSL::Cipher.new 'AES-256-CBC'
			self.cipher.encrypt
			
			@fileWithKeyName = 'private.secure.pem'
			@passPhrase = 'my secure pass phrase goes here'
			@ivFileName = 'iv.txt'
            if key == nil then self.key = readKeyFromFile else self.key = key end
            if iv != nil then self.iv = iv else self.iv = readIvFromFile end
			
			self.cipher.key = Digest::MD5.hexdigest(self.key.to_s)
			self.cipher.iv = self.iv
        end

		def readIvFromFile
			file = File.open(@ivFileName)
			data = file.read
			file.close
			data
		end

		def readKeyFromFile
			key_pem = File.read @fileWithKeyName
			key = OpenSSL::PKey::RSA.new key_pem, @passPhrase
		end

		def encrypt(str)
			encrypted = @cipher.update(str)
			encrypted << @cipher.final
			encoded = Base64.encode64(encrypted).encode('utf-8')
			encoded
		end
		
		def decrypt(encrypted)
			@cipher.decrypt
			decrypted = @cipher.update encrypted
			decrypted << @cipher.final
			decrypter
		end
		
    end

end