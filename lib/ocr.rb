require 'account'

ACCOUNT_LENGTH = LINE_LENGTH * 4

class Ocr
  attr_reader :accounts
  def initialize
    @accounts = []
  end
  def scan file
    read_file file
    parse_accounts
  end
  def read_file file
    File.open file do |file|
      @scanned = file.read
    end
  end
  def parse_accounts
    (0...count_accounts).each do |account_position|
      account_text = extract_account_text account_position
      @accounts << parse_account(account_text)
    end
  end
  def count_accounts
    count_lines / 4
  end
  def count_lines
    lines = @scanned.count "\n"
  end
  def extract_account_text acct_position
    acct_offset = acct_position * ACCOUNT_LENGTH
    @scanned[acct_offset, ACCOUNT_LENGTH]
  end
  def parse_account account_text
    account = Account.new
    account.parse_number account_text
    account
  end
end

