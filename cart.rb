require 'json'
require 'csv'

module MovieParser
 class Cart
  def initialize
    @items = []
  end

  # Метод для додавання елементу до контейнера
  def add_item(item)
    @items << item
  end

  def save_to_file(filename, format)
    case format
    when :json
      save_to_json(filename)
    when :csv
      save_to_csv(filename)
    else
      puts 'Unsupported format'
    end
  end

  def save_to_json(filename)
    json_data = @items.map(&:to_h)
    File.write(filename, JSON.pretty_generate(json_data))
    puts "Cart data saved to #{filename} in JSON format."
  end

  def save_to_csv(filename)
    CSV.open(filename, 'w') do |csv|
      @items.each do |item|
        csv << [item.title, item.rating, item.full_quality, item.genre, item.img_url]
      end
    end
    puts "Cart data saved to #{filename} in CSV format."
  end
 end
end