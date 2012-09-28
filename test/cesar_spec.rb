require 'cesar.rb'

describe "Cesar" do

  it "encripta string simples com algoritimo de Cesar" do
    encriptado = Cesar.encode("ABCDE",3)
    encriptado.should eq("DEFGH")
  end

  it "encripta string composta com algoritimo de Cesar" do
    encriptado = Cesar.encode("String comPosta9",2)
    encriptado.should eq("Uvtkpi eqoRquvcB")
  end

  it "desencripta string simples com algoritimo de Cesar" do
    desencriptado = Cesar.decode("DEFGH",3)
    desencriptado.should eq("ABCDE")
  end

  it "desencripta string composta com algoritimo de Cesar" do
    desencriptado = Cesar.decode("Uvtkpi eqoRquvcb",2)
    desencriptado.should eq("String comPosta9")
  end

  it "descobre a chave utilizada" do
    chave = Cesar.chave("String comPosta9", "Uvtkpi eqoRquvcB")
    chave.should eq(2)
  end

  it "testa proxima letra" do
    proxima_letra = Cesar.proxima_letra("d",12)
    proxima_letra.should eq("p")    
  end

end