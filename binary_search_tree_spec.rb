require './binary_search_tree'

describe Node do
  let(:node1) { Node.new 10 }
  let(:node3) { Node.new 30 }
  let(:node2) { Node.new 20, node1, node3 }

  describe "#binary_search_tree?" do
    it "always returns true for end nodes" do
      node1.should be_binary_search_tree
    end

    it "returns true if left node is smaller than current node vaule " +
       "and right node is always bigger than current node value" do
        node2.should be_binary_search_tree
     end

    let(:left_only) { Node.new 50, node2, nil }
    it "works with node with no right leaf" do
      left_only.should be_binary_search_tree
    end

    let(:right_only) { Node.new 5, nil, node1 }
    it "works with node with no left leaf" do
      right_only.should be_binary_search_tree
    end

    let(:node4) { Node.new 25, node2, nil }
    it "returns false if current node is not the maximum among the left nodes" do
      node2.should be_binary_search_tree
      node4.should_not be_binary_search_tree
    end

    let(:node5) { Node.new 15, nil, node2 }
    it "returns false if current node is not the minimum among the right nodes" do
      node2.should be_binary_search_tree
      node5.should_not be_binary_search_tree
    end
  end
end