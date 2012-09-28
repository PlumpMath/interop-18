$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'encryptor'

module Des
  # Codificacao
  def self.encode(frase, chave)
    # Codifica utilizado a api Encryptor
    encoded = Encryptor.encrypt(:value => frase, :key => chave, :algorithm => "des")
    # Converte de hexadecimal para string    
    encoded.unpack("H*").first
  end

  # Decodificacao
  def self.decode(frase, chave)
    # Deodifica utilizado a api Encryptor
    # Antes converte a frase para hexadecimal
    Encryptor.decrypt(:value => [frase].pack("H*"), :key => chave, :algorithm => "des")
  end  

end