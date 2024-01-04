require 'bundler/setup'
Bundler.require(:default)
require_relative 'cart'
require_relative 'parser'

module MovieParser
 class MainApplication

  def run
    html = URI.open(MovieParser.url)
    doc = Nokogiri::HTML(html)

    # Створення об'єкту корзини для збереження елементів
    cart = Cart.new

    # Виділення елементів із назвами фільмів
    movie_elements = doc.css('div.movie-item.short-item')

    # Parse each item
    movie_elements[0, 10].each_with_index do |movie, index|
      item = Parser.parse_item(movie)
      puts "#{index + 1}. #{item.title} (Жанр - #{item.genre}, Рейтинг - #{item.rating})"
      cart.add_item(item)
    end

    csv_filename = MovieParser.output_path + '/output.csv'
    cart.save_to_csv(csv_filename)

    json_filename = MovieParser.output_path + '/output.json'
    cart.save_to_json(json_filename)
  end
 end
end