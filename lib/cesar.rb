$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'normaliza_string'

module Cesar
  # Monta o Alfabeto de A a Z e 0 a 9
  ALFABETO = ("a".."z").to_a + ("0".."9").to_a

  # Codificacao
  def self.encode(frase, chave)
    # Converte a frase pra minusculo e itera a frase
    # codificando cada letra com a funcao proxima_letra
    encoded = frase.downcase.each_char.collect { |c| proxima_letra(c, chave) }.join

    # utiliza a classe normalize para deixar a frase codificada com os caracteres maisculos 
    # de acordo com a frase original
    NormalizaString.converte_case(encoded, frase)
  end

  # Decodificacao
  def self.decode(frase, chave)
    # Utiliza o mesmo processo de codificacao porem a chave sera
    # o resultado do tamanho do alfabeto menos a propria chave
    # resultando na posicao original exata de acordo com a chave
    self.encode(frase, ALFABETO.size - chave)
  end  

  # Descobrir a chave utilizada
  def self.chave(frase, senha)
    # Dada a frase original, criptografa ela o numero de vezes que for o tamanho do alfabeto
    # Desta forma obtem-se uma lista com todas as possibilidades de criptografia
    # a partir dessa lista é retornado o indice da lista que contem a frase criptografada passada
    # como parametro. O Indice representa a chave usada
    ALFABETO.size.times.collect { |i| self.encode(frase, i) }.index(senha)
  end

  # Andar X letras no alfabeto de acordo com a chave
  def self.proxima_letra(c, chave)
    # retorna o proprio caractere se ele nao estiver no alfabeto (para espacos em brancos)
    return c unless ALFABETO.include?(c)

    # copia o alfabeto em uma variavel temporaria
    a = ALFABETO.clone

    # Obtem o numero posicoes que eh preciso pular no alfabeto para chegar
    # ate a posicao determinada pela chave e faz a iteracao no alfabeto ate
    # chegar nessa posicao
    (a.index(c) + chave).times { |i| a << a.shift }

    # retorna o primeiro elemento do alfabeto, que sera o caractere desejado de acordo com a chave
    a.first
  end
end