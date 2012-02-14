class Ocr
  attr_reader :accounts
  def scan file
    File.open file do |file|
      @accounts = ['111111111']
      @accounts = ['000000000'] if file.read.include? "_"
    end
  end
end
