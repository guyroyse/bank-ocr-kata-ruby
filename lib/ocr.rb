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
      @accounts << extract_account_number(account)
    end
  end
  def read_file file
    File.open file do |file| @scanned = file.read end
  end
  def extract_account_number acct_position
    (0...ACCOUNT_NUMBER_LENGTH).reduce '' do |account, digit_position|
      digit = extract_digit acct_position, digit_position
      account << lookup_number(digit)
    end
  end
  def count_account_numbers
    count_lines / 4
  end
  def extract_digit acct_position, digit_position
    (0...DIGIT_HEIGHT).reduce ''  do |digit, line|
      offset = calculate_offset acct_position, line, digit_position
      digit << @scanned[offset, DIGIT_WIDTH]
    end
  end
  def lookup_number digit
    $digits[digit]
  end
  def count_lines
    lines = @scanned.count "\n"
  end
  def calculate_offset acct_position, line, digit_position
    acct_offset = acct_position * ACCT_LENGTH
    line_offset = line * LINE_LENGTH
    digit_offset = digit_position * DIGIT_WIDTH
    offset = acct_offset + line_offset + digit_offset
  end
end
