$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'normaliza_string'
require 'cesar'

module Vigenere
  # Codificacao
  def self.encode(frase, chave)
    # Usa o algoritimo de cesar para codificar
    # e grava em uma variavel
    algoritimo = lambda { |c, i| Cesar.encode(c, i) }

    # Chama o metodo vigenere passando a frase a chave e o algoritimo
    self.vigenere(frase, chave, algoritimo)
  end

  # Decodificacao
  def self.decode(frase, chave)
    # Usa o algoritimo de cesar para codificar
    # e grava em uma variavel    
    algoritimo = lambda { |c, i| Cesar.decode(c, i) }

    # Chama o metodo vigenere passando a frase a chave e o algoritimo    
    self.vigenere(frase, chave, algoritimo)
  end

  # Aplica a codificacao / decoficacao
  def self.vigenere(frase, chave, algoritimo)
    # converte para minusculo
    chave = chave.downcase.split("")

    # Itera os caracteres da frase
    vigenere = frase.downcase.each_char.collect do |c|   
      # Aplica o algoritimo passado como parametro em cada caractere
      # o numero de casas eh a posicao do elemtno atual da chave no alfabeto
      cesar_c = algoritimo.call(c, Cesar::ALFABETO.index(chave.first))

      # passa para o proximo caractere de chave caso nao seja espaco em branco
      chave << chave.shift if Cesar::ALFABETO.include?(cesar_c)

      # retorna o caractere criptografado / descriptografado
      cesar_c
    end

    # utiliza a classe normalize para deixar a frase codificada com os caracteres maisculos 
    # de acordo com a frase original
    NormalizaString.converte_case(vigenere.join, frase)
  end

  # Descobrir a chave utilizada
  def self.chave(decoded, encoded)
    # Itera cada caractere da string decodificada
    chave = decoded.downcase.split("").each_with_index.collect do |c, i|
      # pula se for espaco em branco
      next unless Cesar::ALFABETO.include?(c)

      # Codifica o caractere e compara se eh igual ao caractere na mesa posicao sa string codificada
      # se for, encontrou a chave para aquela letra
      Cesar::ALFABETO.select { |letra| Cesar.encode(c, Cesar::ALFABETO.index(letra)) == encoded[i].downcase }
    end

    # retorna a chave    
    chave.join
  end
end