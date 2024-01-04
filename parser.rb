require_relative 'item'

module MovieParser
  class Parser
    def self.parse_item(movie)

      # Отримання необхідних даних з рядка
      title = movie.css("a.movie-title").text.strip
      full_quality = movie.css("div.full-quality").text.strip
      image_url = movie.css("div.movie-img > img").attr('src')

      desc = movie.css("div.movie-desk-item.clearfix > div.deck-value")
      rating = desc[0].text.strip
      genre = desc[1].text.strip

      # Створення об'єкту Item та додавання його до масиву
      item = Item.new(title, full_quality, rating, genre, image_url)

      # Повернення масиву елементів
      item
    end
  end
end