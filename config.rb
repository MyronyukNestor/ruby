module MovieParser
    class << self
        attr_accessor :url, :output_path

        # Конфігурація основних параметрів
        def configure
            return to_config unless block_given?
            yield self
        end

        # Форматує основні параметри для виводу
        def to_config
            str = "\nConfigs:\n"
            str += "    Url: #{@url}\n"
            str += "    Output path: #{@output_path}"
            str
        end
    end
end