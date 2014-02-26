#set :haml, :format =&gt; :html5
require './model/test_decrypt_and_encrypt.rb'

 
 
 
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
    decryption_tag = params['decryption_tag']
    @encrypt_result = encrypt_1(decryption_tag)
#    return ( encrypt_result)
   erb:encrypt_result
  end
 
  post '/decrypt_result' do
  encryption_tag = params['encryption_tag']
      @decrypt_result = decrypt_1(encryption_tag)
          erb:decrypt_result
  end





