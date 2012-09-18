$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'verifica_case'
require 'cesar'

module Vigenere
  def self.encode(frase, chave)
    algoritimo = lambda { |c, i| Cesar.encode(c, i) }
    self.vigenere(frase, chave, algoritimo)
  end

  def self.decode(frase, chave)
    algoritimo = lambda { |c, i| Cesar.decode(c, i) }
    self.vigenere(frase, chave, algoritimo)
  end

  def self.vigenere(frase, chave, algoritimo)
    chave = chave.downcase.split("")
    vigenere = frase.downcase.each_char.collect do |c|   
      cesar_c = algoritimo.call(c, Cesar::ALFABETO.index(chave.first))
      chave << chave.shift if Cesar::ALFABETO.include?(cesar_c)
      cesar_c
    end
    VerificaCase.converte_case(vigenere.join, frase)
  end

  def self.chave(decoded, encoded)
    chave = decoded.downcase.split("").each_with_index.collect do |c, i|
      next unless Cesar::ALFABETO.include?(c)
      Cesar::ALFABETO.select { |letra| Cesar.encode(c, Cesar::ALFABETO.index(letra)) == encoded[i].downcase }
    end    
    chave.join
  end
end