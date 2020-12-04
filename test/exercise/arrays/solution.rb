module Exercise
  module Arrays
    class << self
      def get_max(array)
        iter = ->(max, arr) do
          return max if arr.empty?
          first, *rest = arr
          max = first > max ? first : max
          iter.call(max, rest)
        end
        first, *rest = array
        iter.call(first, rest)
      end

      def replace(array)
        max_num = get_max(array)
        array.map { |num| num.positive? ? max_num : num }
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
