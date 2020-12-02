module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        mapped = array.map do |film|
          country_count = film['country'] ? film['country'].split(',').size : 0
          rating = film['rating_kinopoisk'] ? film['rating_kinopoisk'].to_f : 0
          item = {}
          item['country_count'] = country_count
          item['rating'] = rating
          item
        end
        selected = mapped.select { |film| film['country_count'] >= 2 && film['rating'].positive? }
        sum_rating = selected.reduce(0) { |acc, film| acc + film['rating'] }
        sum_rating / selected.size
      end

      def chars_count(films, threshold)
        films.reduce(0) do |count, film|
          rating = film['rating_kinopoisk'] ? film['rating_kinopoisk'].to_f : 0
          if rating < threshold
            count
          else
            count + film['name'].chars.reduce(0) { |acc, char| char == 'и' ? (acc + 1) : acc }
          end
        end
      end
    end
  end
end
