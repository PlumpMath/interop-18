require 'rail_fence.rb'

describe "RailFence" do

  it "encripta string simples com algoritimo de rail fence" do
    encriptado = RailFence.encode("railfenceme", 3)
    encriptado.should eq("rlnmafceiee")
  end

  it "encripta string composta com algoritimo de rail fence" do
    encriptado = RailFence.encode("rail fence me", 3)
    encriptado.should eq("rlnm afcei ee")
  end  

  it "desencripta string simples com algoritimo de rail fence" do
    desencriptado = RailFence.decode("rlnmafceiee", 3)
    desencriptado.should eq("railfenceme")
  end

  it "desencripta string composta com algoritimo de rail fence" do
    desencriptado = RailFence.decode("rlnm afcei ee", 3)
    desencriptado.should eq("rail fence me")
  end  

  it "descobre a chave utilizada para criptografar string" do
    chave = RailFence.chave("rail fence me", "rlnm afcei ee")
    chave.should eq(3)
  end

end