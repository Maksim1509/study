module Exercise
  module Arrays
    class << self
      def get_max(max, array)
        return max if array.empty?

        first, *rest = array
        max = first > max ? first : max
        get_max(max, rest)
      end

      def replace(array)
        first, *rest = array
        max_num = get_max(first, rest)
        array.map! { |num| num.positive? ? max_num : num }
      end

      def search_iter(low, high, array, query)
        if low == high
          return array[low] == query ? low : -1
        end

        mid = (low + high) / 2
        guess = array[mid]
        return mid if guess == query

        guess > query ? high = mid - 1 : low = mid + 1
        search_iter(low, high, array, query)
      end

      def search(array, query)
        return -1 if array.empty?

        low = 0
        high = array.size - 1
        search_iter(low, high, array, query)
      end
    end
  end
end
