class Cesar

  ALFABETO = ("a".."z").to_a + (0..9).to_a
  
  def initialize
    @possibilidades = []
  end

  def quebrar(senha)    
    caracteres = senha.split("")            
    ALFABETO.size.times do |i|
      caracteres.map! { |c| move_casa(c) }  
      @possibilidades << caracteres.join("")
    end
  end

  def move_casa(c)
    return "a"  if c == 9  
    return " "  if c == " "  
    
    c.downcase! unless c.kind_of?(Integer)
    return ALFABETO[ALFABETO.index(c) + 1]
  end

  def listar_possibilidades
    @possibilidades.reverse.each_with_index do |p, i|
      puts "#{p} - #{i}"
    end
  end

end

# cesar = Cesar.new
# cesar.quebrar("mrvxh")
# cesar.listar_possibilidades
# cesar.revelar_cifra