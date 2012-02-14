require 'ocr'

describe Ocr do

  it "parses an account number of all 0s" do
    subject.scan 'spec/000000000.txt'
    subject.accounts[0].should == '000000000'
  end

  it "parses and account number of all 1s" do
    subject.scan 'spec/111111111.txt'
    subject.accounts[0].should == '111111111'
  end

end
