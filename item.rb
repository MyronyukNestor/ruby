module MovieParser
  class Item
    attr_accessor :title, :full_quality, :rating, :genre, :img_url
  
    def initialize(title, full_quality, rating, genre, img_url)
      @title = title
      @full_quality = full_quality
      @rating = rating      
      @genre = genre
      @img_url = img_url
    end
  
    def info(&block)
      block.call(self)
    end
  
    def to_s
      "#{title} (#{rating}), #{full_quality}, #{genre}, #{img_url}"
    end
  
    def to_h
      {
        title: title,
        rating: rating,
        full_quality: full_quality,
        genre: genre,
        img_url: img_url
      }
    end
  end
end