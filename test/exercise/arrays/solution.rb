module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = array.max
        array.map! { |num| num.positive? ? max_num : num }
      end

      def search(array, query)
        low = 0
        high = array.size - 1

        while low <= high
          mid = (low + high) / 2
          guess = array[mid]
          return mid if guess == query

          guess > query ? high = mid - 1 : low = mid + 1
        end
        -1
      end
    end
  end
end
