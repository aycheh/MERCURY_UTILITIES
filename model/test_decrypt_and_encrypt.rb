#!/usr/bin/env ruby'
require 'kona_aes'

# params_encryption = bytes_to_string(encrypt(KEY, "ci=#{@conversion_tag.campaign_id}&evi=#{@conversion_tag.event_id}&exd=#{@conversion_tag.expiration}"))
# encryption_tag = "b33d2ec4acc2133f1f3bd891745f948dcd5c5ec14a8014a1c9744219c6e7e84f"
# Example tag = "ci=#{1234}&evi=#{34}&exd=#{30}"


class EncryptDecrypt
 def encrypt_1(tag)
   begin
      tag = bytes_to_string( encrypt(KEY ,tag) )       
      decrypt_1(tag)  
    return tag
       rescue => e
	return "Invalid tag"
    end 
 end



 def decrypt_1(encryption_tag)
        encryption_tag = string_to_bytes(encryption_tag)
    begin
        decrypted_tag = decrypt(KEY,encryption_tag)
        return decrypted_tag
    rescue => e
	return "Invalid tag"
    end
  end
 
end 
 