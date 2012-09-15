class Cesar

  ALFABETO = ("a".."z").to_a + ("0".."9").to_a
  
  def initialize
    @possibilidades = []
  end

  def possibilidades
    @possibilidades
  end

  def quebrar(senha)    
    caracteres = senha.split("")            
    ALFABETO.size.times do |i|
      caracteres.map! { |c| move_casa(c) }      
      @possibilidades << converte_case(caracteres.join, senha)
    end
  end

  def move_casa(c)
    return "a"  if c == "9"  
    return " "  if c == " "         
    return ALFABETO[ALFABETO.index(c.downcase) + 1]
  end

  def converte_case(frase, original)
    caracteres = frase.split("")    
    caracteres.map!.with_index { |p, i| original[i] == original[i].upcase ? p.upcase : p }
    caracteres.join
  end

end