DIGIT_WIDTH = 3
DIGIT_HEIGHT = 3

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

DIGITS = {
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

class Digit

  attr_reader :value

  def parse text
    @value = DIGITS[text]
  end

end
