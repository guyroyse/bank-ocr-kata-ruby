require 'ocr'

describe Ocr do

  def check_account_number number
    subject.scan "spec/#{number}.txt"
    subject.accounts[0].should == number
  end

  it "parses an account number of all 0s" do
    check_account_number '000000000'
  end

  it "parses and account number of all 1s" do
    check_account_number '111111111'
  end

  it "parses and account number of all 2s" do
    check_account_number '222222222'
  end

  it "parses and account number of all 3s" do
    check_account_number '333333333'
  end

  it "parses and account number of all 4s" do
    check_account_number '444444444'
  end

  it "parses and account number of all 5s" do
    check_account_number '555555555'
  end

  it "parses and account number of all 6s" do
    check_account_number '666666666'
  end

  it "parses and account number of all 7s" do
    check_account_number '777777777'
  end

  it "parses and account number of all 8s" do
    check_account_number '888888888'
  end

end
