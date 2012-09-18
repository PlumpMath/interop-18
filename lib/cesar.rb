$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'verifica_case'

module Cesar
  ALFABETO = ("a".."z").to_a

  def self.encode(frase, chave)
    encoded = frase.downcase.each_char.collect { |c| move_casa(c, chave) }.join
    VerificaCase.converte_case(encoded, frase)
  end

  def self.decode(frase, chave)
    self.encode(frase, ALFABETO.size - chave)
  end  

  def self.move_casa(c, chave)
    return c unless ALFABETO.include?(c)
    a = ALFABETO.clone
    (a.index(c) + chave).times { |i| a << a.shift }
    a.first
  end
end