module Exercise
  module Arrays
    class << self
      def replace(array)
        def get_max(array)
          def iter(max, ar)
            return max if ar.size == 0
            first, *rest = ar
            max = first > max ? first : max
            iter(max, rest)
          end
          first, *rest = array
          iter(first, rest)
        end
        max_num = get_max(array)
        array.map! { |num| num.positive? ? max_num : num }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
