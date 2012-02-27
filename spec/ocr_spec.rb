require 'ocr'

describe Ocr do

  context "when processing a file with a single account number" do

    def check_account_number number
      subject.scan "spec/#{number}.txt"
      subject.accounts[0].number.should == number
    end

    it "parses an account number of all 0s" do
      check_account_number '000000000'
    end

    it "parses an account number of all 1s" do
      check_account_number '111111111'
    end

    it "parses an account number of all 2s" do
      check_account_number '222222222'
    end

    it "parses an account number of all 3s" do
      check_account_number '333333333'
    end

    it "parses an account number of all 4s" do
      check_account_number '444444444'
    end

    it "parses an account number of all 5s" do
      check_account_number '555555555'
    end

    it "parses an account number of all 6s" do
      check_account_number '666666666'
    end

    it "parses an account number of all 7s" do
      check_account_number '777777777'
    end

    it "parses an account number of all 8s" do
      check_account_number '888888888'
    end

    it "parses an account number of all 9s" do
      check_account_number '999999999'
    end

    it "parses an account number containing a sequence of numbers" do
      check_account_number '123456789'
    end

    it "parses an account number containing differing digits" do
      check_account_number '340021498'
    end

  end

  context "when handed a file with muliple account numbers" do

    before :each do
      subject.scan "spec/multiple.txt"
    end

    it "returns the correct number of accounts" do
      subject.accounts.length.should == 3
    end

    it "returns the correct account number for the first account" do
      subject.accounts[0].number.should == '340021496'
    end

    it "returns the correct account number for a middle account" do
      subject.accounts[1].number.should == '340021497'
    end

    it "returns the correct account number for the last account" do
      subject.accounts[2].number.should == '340021498'
    end

  end

end

describe Account do

  context "when calculating the checksum" do

    it "adds the last digit to the checksum" do
      subject.number = '000000001'
      subject.checksum.should == 1
    end

    it "adds double the next to the last digit to the checksum" do
      subject.number = '000000011'
      subject.checksum.should == 3
    end

    it "adds triple the third to the last digit to the checksum" do
      subject.number = '000000111'
      subject.checksum.should == 6
    end

    it "it removes all 11s from the total of the checksum" do
      subject.number = '000011111'
      subject.checksum.should == 4
    end

    it "uses all digits" do
      subject.number = '111111111'
      subject.checksum.should == 1
    end

    it "handles digits other than 1" do
      subject.number = '987654321'
      subject.checksum.should == 10
    end

  end

end
