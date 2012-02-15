ZERO   = ' _ ' +
         '| |' +
         '|_|'

ONE    = '   ' +
         '  |' +
         '  |'

TWO    = ' _ ' +
         ' _|' +
         '|_ '

THREE = ' _ ' +
        ' _|' +
        ' _|'

FOUR  = '   ' +
        '|_|' +
        '  |'

FIVE  = ' _ ' +
        '|_ ' +
        ' _|'

SIX   = ' _ ' +
        '|_ ' +
        '|_|'

SEVEN = ' _ ' +
        '  |' +
        '  |'

EIGHT = ' _ ' +
        '|_|' +
        '|_|'

NINE  = ' _ ' +
        '|_|' +
        ' _|'

$digits = {
  ZERO  => '0',
  ONE   => '1',
  TWO   => '2',
  THREE => '3',
  FOUR  => '4',
  FIVE  => '5',
  SIX   => '6',
  SEVEN => '7',
  EIGHT => '8',
  NINE  => '9'
}

DIGIT_WIDTH = 3
DIGIT_HEIGHT = 3
ACCOUNT_NUMBER_LENGTH = 9
LINE_LENGTH = DIGIT_WIDTH * ACCOUNT_NUMBER_LENGTH + 1

class Ocr
  attr_reader :accounts
  def scan file
    File.open file do |file|
      @scanned = file.read
      account = extract_account_number
      @accounts = [account]
    end
  end
  def extract_account_number
    (0...ACCOUNT_NUMBER_LENGTH).reduce '' do |account, position|
      digit = extract_digit position
      account << lookup_number(digit)
    end
  end
  def extract_digit position
    (0...DIGIT_HEIGHT).reduce ''  do |digit, line|
      offset = calculate_offset line, position
      digit << @scanned[offset, DIGIT_WIDTH]
    end
  end
  def lookup_number digit
    $digits[digit]
  end
  def calculate_offset line, position
    line_offset = line * LINE_LENGTH
    digit_offset = position * DIGIT_WIDTH
    offset = line_offset + digit_offset
  end
end
