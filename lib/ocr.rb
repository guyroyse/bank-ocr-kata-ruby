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

$digits = {
  ZERO  => '0',
  ONE   => '1',
  TWO   => '2',
  THREE => '3'
}

class Ocr
  attr_reader :accounts
  def scan file
    File.open file do |file|
      scanned = file.read
      digit = extract_digit(scanned)
      number = lookup_number(digit)
      @accounts = [number * 9]
    end
  end
  def extract_digit s
    (0..2).reduce ''  do |digit, count|
      digit + s[count * 28, 3]
    end
  end
  def lookup_number digit
    $digits[digit]
  end
end
