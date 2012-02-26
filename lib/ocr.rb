require 'account'

ACCOUNT_LENGTH = LINE_LENGTH * 4

class Ocr
  attr_reader :accounts
  def initialize
    @accounts = []
  end
  def scan file
    read_file file
    (0...count_account_numbers).each do |account|
      account_text = extract_account_text account
      @accounts << parse_account_number(account_text)
    end
  end
  def read_file file
    File.open file do |file| @scanned = file.read end
  end
  def count_account_numbers
    count_lines / 4
  end
  def count_lines
    lines = @scanned.count "\n"
  end
  def extract_account_text acct_position
    acct_offset = acct_position * ACCOUNT_LENGTH
    @scanned[acct_offset, ACCOUNT_LENGTH]
  end
  def parse_account_number account_text
    account = Account.new
    account.parse_number account_text
    account
  end
end

