module VerificaCase
  def self.converte_case(frase, original)
    frase.split("").map.with_index { |p, i| original[i] == original[i].upcase ? p.upcase : p }.join    
  end
end