require 'digit'

ACCOUNT_NUMBER_LENGTH = 9
LINE_LENGTH = DIGIT_WIDTH * ACCOUNT_NUMBER_LENGTH + 1

class Account
  attr_accessor :number
  def parse_number text
    @text = text
    @number = (0...ACCOUNT_NUMBER_LENGTH).reduce '' do |account_number, digit_position|
      digit_text = extract_digit_text digit_position
      account_number << Digit.new(digit_text).value
    end
  end
  def checksum
    @number[-1].to_i + @number[-2,1].to_i * 2
  end
  def extract_digit_text digit_position
    (0...DIGIT_HEIGHT).reduce ''  do |digit, line|
      offset = calculate_offset line, digit_position
      digit << @text[offset, DIGIT_WIDTH]
    end
  end
  def calculate_offset line, digit_position
    line_offset = line * LINE_LENGTH
    digit_offset = digit_position * DIGIT_WIDTH
    offset = line_offset + digit_offset
  end
end
