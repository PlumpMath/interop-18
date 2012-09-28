require 'normaliza_string.rb'

describe "NormalizaString" do

  it "aplica padrao de upcase / downcase" do
    string = "ruby e Sinatra app"
    padrao = "Aaaa b ccccccC Ddd"
    normalizado = NormalizaString.converte_case(string, padrao)
    normalizado.should eq("Ruby e sinatrA App")
  end

  it "aplica espacos na string" do
    string = "rubyesinatraapp"
    padrao = "aaaa b ccccccc ddd"
    normalizado = NormalizaString.adiciona_espacos(string, padrao)
    normalizado.should eq("ruby e sinatra app")
  end  

end