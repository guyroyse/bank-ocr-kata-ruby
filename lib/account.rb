require 'digit'

ACCOUNT_NUMBER_LENGTH = 9
LINE_LENGTH = DIGIT_WIDTH * ACCOUNT_NUMBER_LENGTH + 1

class Account

  attr_accessor :number

  def parse_number text
    @number = (0...ACCOUNT_NUMBER_LENGTH).reduce '' do |account_number, digit_position|
      digit_text = extract_digit_text text, digit_position
      account_number << parse_digit(digit_text)
    end
  end
  def checksum
    total = (1..ACCOUNT_NUMBER_LENGTH).reduce 0 do |checksum, digit|
      checksum + @number[digit*-1].to_i * digit
    end
    total % 11
  end
  def valid
    checksum == 0
  end
  def extract_digit_text text, digit_position
    (0...DIGIT_HEIGHT).reduce ''  do |digit, line|
      offset = calculate_offset line, digit_position
      digit << text[offset, DIGIT_WIDTH]
    end
  end
  def calculate_offset line, digit_position
    line_offset = line * LINE_LENGTH
    digit_offset = digit_position * DIGIT_WIDTH
    offset = line_offset + digit_offset
  end
  def parse_digit text
    digit = Digit.new
    digit.parse text
    digit.value
  end

end
