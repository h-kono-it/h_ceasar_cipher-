# frozen_string_literal: true

RSpec.describe HCeasarCipher do
  it "has a version number" do
    expect(HCeasarCipher::VERSION).not_to be nil
  end

  it "シーザー暗号化" do
    expect(HCeasarCipher.encrypt("abc", 1)).to eq("bcd")
  end
  
  it "シーザー復号化" do
    expect(HCeasarCipher.decrypt("bcd", 1)).to eq("abc")
  end

end
