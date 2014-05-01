#set :haml, :format =&gt; :html5
require './model/test_decrypt_and_encrypt.rb'
require './model/convert_Adtech_tag_into_Adtech_script_tag.rb'
#require 'open-uri'
 
 
 
  get "/" do
    erb :index
end

  
  get '/index' do
      erb :index
end
  

  get '/decrypt_encrypt' do
    erb:decrypt_encrypt
end

  post '/encrypt_result' do
    encrypt_result = EncryptDecrypt.new
    decryption_tag = params['decryption_tag']
    @encrypt_result = encrypt_result.encrypt_1(decryption_tag)
      erb:encrypt_result
end
 
  post '/decrypt_result' do
    decrypt_result = EncryptDecrypt.new
    encryption_tag = params['encryption_tag']
      @decrypt_result = decrypt_result.decrypt_1(encryption_tag)
          erb:decrypt_result
end

  
   get '/convert_adtech_tag' do
    erb:convert_adtech_tag
end
  
  

post '/convert_result' do
    @ad_ids = params['AD_IDs']
    p @ad_ids
      @convert_result = get_script_tag(@ad_ids)
          erb:convert_result
end


get '/download' do
  content_type "text/plain" 
  attachment("./script_list.txt")
  send_file("./script_list.txt")
end







