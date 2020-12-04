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

      def search(_array, _query)
        0
      end
    end
  end
end
