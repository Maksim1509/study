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

      def search(_array, _query)
        0
      end
    end
  end
end
