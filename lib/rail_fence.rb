$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'normaliza_string'

module RailFence
  # Codificacao
  def self.encode(frase, chave)
    # cria uma lista do tamanho da chave 
    # de forma que cada elemento seja uma outra lista (numero de linhas)
    encoded = Array.new(chave) { |i| i = [] }

    # remove os espacos em branco
    chars   = frase.gsub(/\s+/, "").split("")

    # Copia os caracteres para o array vazio
    # a cada iteracao coloca o caractere em uma linha diferente
    until chars.empty? do
      0.upto(chave-1) { |i| encoded[i] << chars.shift }
    end

    # Adiciona os espacos na string codificada de acordo com a frase original 
    NormalizaString.adiciona_espacos(encoded.join, frase)
  end

  # Decodificacao
  def self.decode(original, chave)
    # remove espacoes em branco
    encoded = original.gsub(/\s+/, "")

    # cria uma lista com o numero de posicoes de acordo com o numero de caracteres
    desencriptado = Array.new(encoded.size)

    # contador para a posicao na string decodificada
    j = 0

    # itera o numero de vezes da chave
    chave.times do |i|

      # usa result para saber a coluna atual
      result = i

      # adiciona o primeiro item da coluna na lista e incrementa j
      # o numero da coluna e determinado pelo numero da iteracao com a chave
      desencriptado[result] = encoded[j]
      j += 1

      # Depois do primeiro elemento da coluna, pega o restante dos itens desta coluna
      # Usa result + chave para identificar de onde comecar a iterar e pegar os dados na coluna certa
      until (result+chave) >= encoded.size
        result += chave
        desencriptado[result] = encoded[j]
        j += 1
      end
    end
  
    # Adiciona os espacos na string codificada de acordo com a frase original 
    NormalizaString.adiciona_espacos(desencriptado.join, original)
  end

  # Descobrier a chave
  def self.chave(frase, senha)
    # Codifica a frase utilizado de 1 ao tamanho da frase ate que a mesma seja igual a senha
    # quando for igual, o numero de iteracoes sera a chave utilizada
    1.upto(frase.size).select { |i| self.encode(frase, i) == senha }.first
  end
end