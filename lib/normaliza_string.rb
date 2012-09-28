module NormalizaString
  
  # Coloca caracteres em maisculo de acordo com a string original
  def self.converte_case(frase, original)
    frase.downcase.split("").map.with_index { |p, i| original[i] == original[i].upcase ? p.upcase : p }.join    
  end

  # Coloca espacos em branco de acordo com a string original
  def self.adiciona_espacos(frase, original)
    original.each_char.with_index { |c, i| frase.insert(i, c) if c == " " }
    frase
  end

end