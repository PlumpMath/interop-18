require 'vigenere.rb'

describe "Vigenere" do

  it "encripta string simples com algoritimo de vigenere" do
    encriptado = Vigenere.encode("vigenerealgo", "defgh")
    encriptado.should eq("ymlkuhvjgsjs")
  end

  it "encripta string composta com algoritimo de vigenere" do
    encriptado = Vigenere.encode("Vigenere Algo", "defgh")
    encriptado.should eq("Ymlkuhvj Gsjs")
  end

  it "desencripta string simples com algoritimo de vigenere" do
    desencriptado = Vigenere.decode("ymlkuhvjgsjs", "defgh")
    desencriptado.should eq("vigenerealgo")
  end

  it "desencripta string composta com algoritimo de vigenere" do
    desencriptado = Vigenere.decode("Ymlkuhvj Gsjs", "defgh")
    desencriptado.should eq("Vigenere Algo")
  end

  it "descobre a chave usada para encriptar com algoritimo de vigenere" do
    chave = Vigenere.chave("Vigenere Algo", "Ymlkuhvj Gsjs")
    encriptado = Vigenere.encode("Vigenere Algo", chave)
    encriptado.should eq("Ymlkuhvj Gsjs")
  end

end