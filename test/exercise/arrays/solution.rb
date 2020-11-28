module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = array.max
        array.map! { |num| num > 0 ? max_num : num }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
