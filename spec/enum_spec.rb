
require_relative "../lib/enum"

describe Enumerable do
  describe " \n #my_each \n" do 
    context "given an array \n" do
      it "prints each element in the array then returns an original array" do
        actual = ['Sharon','Leo','Leila','Brian','Arun'].my_each { |friend| puts friend }
        expected = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
        expect(actual).to eql(expected)
      end
    end
  end
  
  describe "#my_each_with_index" do
    context "given an array" do
      it "print out even-indexed element returns an empty array" do
        actual = ['Sharon','Leo','Leila','Brian','Arun'].my_each_with_index { |friend, index| friend if index.even? }
        expected = ['Sharon','Leo','Leila','Brian','Arun'].each_with_index { |friend, index| friend if index.even? }
        expect(actual).to eql(expected)
      end
    end
  end
  describe "#my_select" do
    context "select out friends who meet the condition" do
      it "prints conditioned block then returns an empty array" do
        expect(%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' }).to eql(["Sharon", "Leo", "Leila", "Arun"])
      end
    end
  end
  
  describe "#my_all" do
    context "print out true or false depending if all elements meet the condition" do
      it "returns true" do
        expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
      end
      it "returns false" do
        expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }).to eql(false)
      end
      it "returns false" do
        expect(%w[ant bear cat].my_all?(/t/) ).to eql(false)
      end
      it "returns true" do
        expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
      end
      it "returns true" do
        expect([].my_all?).to eql(true)
      end
      it "returns false" do
        expect([1, 2, 3].my_all?(3)).to eql(false)
      end
      it "returns true" do
        expect([1, 2, 3].my_all? ).to eql(true)
      end
    end
  end
  describe "#my_any" do
    context "print out friends" do
      it "returns an empty array" do
        expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eql(true)
      end
      it "returns an empty array" do
        expect(%w[ant bear cat].my_any? { |word| word.length >= 4 }).to eql(true)
      end
      it "returns an empty array" do
        expect(%w[ant bear cat].my_any?(/d/)).to eql(false)
      end
      it "returns an empty array" do
        expect([nil, true, 99].my_any?(Integer)).to eql(true)
      end
      it "returns an empty array" do
        expect([nil, true, 99].my_any?).to eql(true)
      end
      it "returns an empty array" do
        expect([].my_any?).to eql(false)
      end
      it "returns an empty array" do
        expect([1, 2, 3].my_any?(3)).to eql(true)
      end
      it "returns an empty array" do
        expect(%w[e dd].my_any?(/d/)).to eql(true)
      end
      it "returns an empty array" do
        expect(["car","cat","dog"].my_any?("cat")).to eql(true)
      end
    end
  end
  describe "#my_none" do
    context "print out friends" do
      it "returns an empty array" do
        expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eql(true)
      end
      it "returns an empty array" do
        expect(%w[ant bear cat].my_none? { |word| word.length == 4 }).to eql(false)
      end
      it "returns an empty array" do
        expect(%w[ant bear cat].my_none?(/d/)).to eql(true)
      end
      it "returns an empty array" do
        expect([1, 3.14, 42].my_none?(Float)).to eql(false)
      end
      it "returns an empty array" do
        expect([].my_none?).to eql(true)
      end
      it "returns an empty array" do
        expect([nil].my_none?).to eql(true)
      end
      it "returns an empty array" do
        expect([nil, false].my_none?).to eql(true)
      end
      it "returns an empty array" do
        expect([nil, false, true].my_none?).to eql(false)
      end
      it "returns an empty array" do
        expect(%w[e dd].my_none?(/d/)).to eql(false)
      end
      it "returns an empty array" do
        expect([1, 2, 3].my_none?(3)).to eql(false)
      end
      it "returns an empty array" do
        expect(["car","cat","dog"].my_none?("cat")).to eql(false)
      end
      it "returns an empty array" do
        expect([1,2,2].my_none?(3)).to eql(true)
      end
      
    end
  end


  describe "my_count" do
    context "\ngiven an array\n" do
      it "returns the number of items satisfying the condition stated as an argument" do
        expect([1, 2, 4, 2].my_count(2)).to eql(2)
      end
      it "returns " do
        expect([1, 2, 4, 2].my_count).to eql(4)
      end
      it "whatever" do
        expect([1, 2, 4, 2].my_count{ |n| (n % 2).zero? }).to eql(3)
      end
    end
  end

describe "my_map" do
  context "" do
    it "dd" do
      expect(['medium Big Mac', 'medium fries', 'medium milkshake'].my_map{ |item| item.gsub('medium', 'extra large')}).to eql(['medium Big Mac', 'medium fries', 'medium milkshake'].map{  |item| item.gsub('medium', 'extra large')})
    end
    it "dd" do
      expect((0..5).my_map{ |i| i * i }).to eql((0..5).my_map { |i| i * i })
    end
  end
  context "my_map_proc" do
    it " " do
      my_proc = proc { |i| i * i }
      expect((1..5).my_map(&my_proc)).to eql((1..5).map(&my_proc))
    end
  end
end


describe do 
  context " " do
    it " " do
      expect((1..5).my_inject {|sum, n| sum + n }).to eql(15)
    end
    it " " do
      expect((1..5).my_inject(1) {|product, n| product * n }).to eql(120)
    end
    it " " do
      expect([2, 3].my_inject(20, :*)).to eql(120)
    end
    it " " do
      expect([2, 3, 4].my_inject(:+)).to eql(9)
    end
    it " " do
      expect(["ant", "bear", "cat"].my_inject {|memo, word|  memo.length > word.length ? memo : word}).to eql("bear")
    end
  end
end

end
