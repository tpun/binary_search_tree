module BinarySearchTree
  Infinite_Range = -1.0/0..1.0/0

  def binary_search_tree? valid_range=Infinite_Range
    return false unless valid_range.include? @value
    return false if @left and @value < @left.value
    return false if @right and @value > @right.value

    # left nodes can't be bigger than the upper bound and
    # right nodes can't be smaller than the lower bound
    left_range = (valid_range.min)..([valid_range.max, @value].min)
    right_range= ([valid_range.min, @value].max)..(valid_range.max)

    ( @left.nil? or  @left.binary_search_tree?( left_range)) and
    (@right.nil? or @right.binary_search_tree?(right_range))
  end
end

class Node
  attr_reader :value
  def initialize value, left=nil, right=nil
    @value = value
    @left = left
    @right = right
  end

  include BinarySearchTree
end
