require './model/test_decrypt_and_encrypt.rb'


describe "decrypt tag" do
      it "should decrypt the encyped tag" do
      decrypted_tag = EncryptDecrypt.new
      encrypted_tag = "c4bc77ca44cc82a23ff439da9285fe49143d6dbc9a768abe36ea1bcb36a388e7372c72536ac940c3685aa3f33ea1291d"
      decrypted_tag = decrypted_tag.decrypt_1(encrypted_tag)
      decrypted_tag.should == "\"ci=\#{1234}&evi=\#{34}&exd=\#{30}\""
      end
  end


describe "encrypt tag" do
      it "should encrypt the given tag" do
      tag = EncryptDecrypt.new
      tag_to_encrypt = "ci=#{1234}&evi=#{34}&exd=#{30}"
      encrypted_tag = tag.encrypt_1(tag_to_encrypt)
      encrypted_tag.should == "b33d2ec4acc2133f1f3bd891745f948dcd5c5ec14a8014a1c9744219c6e7e84f"
      end
  end
  
  
