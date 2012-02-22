require 'digits'

DIGIT_WIDTH = 3
DIGIT_HEIGHT = 3
ACCOUNT_NUMBER_LENGTH = 9
LINE_LENGTH = DIGIT_WIDTH * ACCOUNT_NUMBER_LENGTH + 1
ACCT_LENGTH = LINE_LENGTH * 4

class Ocr
  attr_reader :accounts
  def initialize
    @accounts = []
  end
  def scan file
    read_file file
    (0...count_account_numbers).each do |account|
      account_text = extract_account_text account
      @accounts << Account.new(account_text).number
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
    acct_offset = acct_position * ACCT_LENGTH
    @scanned[acct_offset, ACCT_LENGTH]
  end
end

class Account
  attr_reader :number
  def initialize text
      @scanned = text
      @number = extract_account_number
  end
  def extract_account_number
    (0...ACCOUNT_NUMBER_LENGTH).reduce '' do |account, digit_position|
      digit = extract_digit digit_position
      account << lookup_number(digit)
    end
  end
  def extract_digit digit_position
    (0...DIGIT_HEIGHT).reduce ''  do |digit, line|
      offset = calculate_offset line, digit_position
      digit << @scanned[offset, DIGIT_WIDTH]
    end
  end
  def lookup_number digit
    $digits[digit]
  end
  def calculate_offset line, digit_position
    line_offset = line * LINE_LENGTH
    digit_offset = digit_position * DIGIT_WIDTH
    offset = line_offset + digit_offset
  end
end
