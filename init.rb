require_relative 'config'

MovieParser.configure do |parser|
  parser.url = 'https://uakino.club/filmy/'
  parser.output_path = 'C:\ruby2'

  puts parser.to_config
end

