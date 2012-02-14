require 'ocr'

describe Ocr do

  it "parses an account number of all 0s" do
    subject.scan '000000000.txt'
    subject.accounts[0].should == '000000000'
  end

end
