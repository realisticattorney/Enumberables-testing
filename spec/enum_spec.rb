
require_relative "../lib/enum"

  ## if(context) return it

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
        expected = ['Sharon', 'Leila', 'Arun']
        expect(actual).to eql(expected)
      end
    end
  end
  # describe "#my_select" do
  #   context "select out friends who meet the condition" do
  #     it "prints conditioned block then returns an empty array" do
  #       expect(%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' }).to eql(["Sharon", "Leo", "Leila", "Arun"])
  #     end
  #   end
  # end
  
  # describe "#my_all" do
  #   context "print out true or false depending if all elements meet the condition" do
  #     it "returns true" do
  #       expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
  #     end
  #     it "returns false" do
  #       expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }).to eql(false)
  #     end
  #     it "returns false" do
  #       expect(%w[ant bear cat].my_all?(/t/) ).to eql(false)
  #     end
  #     it "returns true" do
  #       expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
  #     end
  #     it "returns true" do
  #       expect([].my_all?).to eql(true)
  #     end
  #     it "returns false" do
  #       expect([1, 2, 3].my_all?(3)).to eql(false)
  #     end
  #     it "returns true" do
  #       expect([1, 2, 3].my_all? ).to eql(true)
  #     end
  #   end
  # end
  # describe "#my_any" do
  #   context "print out friends" do
  #     it "returns an empty array" do
  #       expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect(%w[ant bear cat].my_any? { |word| word.length >= 4 }).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect(%w[ant bear cat].my_any?(/d/)).to eql(false)
  #     end
  #     it "returns an empty array" do
  #       expect([nil, true, 99].my_any?(Integer)).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect([nil, true, 99].my_any?).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect([].my_any?).to eql(false)
  #     end
  #     it "returns an empty array" do
  #       expect([1, 2, 3].my_any?(3)).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect(%w[e dd].my_any?(/d/)).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect(["car","cat","dog"].my_any?("cat")).to eql(true)
  #     end
  #   end
  # end
  # describe "#my_none" do
  #   context "print out friends" do
  #     it "returns an empty array" do
  #       expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect(%w[ant bear cat].my_none? { |word| word.length == 4 }).to eql(false)
  #     end
  #     it "returns an empty array" do
  #       expect(%w[ant bear cat].my_none?(/d/)).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect([1, 3.14, 42].my_none?(Float)).to eql(false)
  #     end
  #     it "returns an empty array" do
  #       expect([].my_none?).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect([nil].my_none?).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect([nil, false].my_none?).to eql(true)
  #     end
  #     it "returns an empty array" do
  #       expect([nil, false, true].my_none?).to eql(false)
  #     end
  #     it "returns an empty array" do
  #       expect(%w[e dd].my_none?(/d/)).to eql(false)
  #     end
  #     it "returns an empty array" do
  #       expect([1, 2, 3].my_none?(3)).to eql(false)
  #     end
  #     it "returns an empty array" do
  #       expect(["car","cat","dog"].my_none?("cat")).to eql(false)
  #     end
  #     it "returns an empty array" do
  #       expect([1,2,2].my_none?(3)).to eql(true)
  #     end
      
  #   end
  # end
  # describe "#my_count" do
  #   context "print out friends" do
  #     it "returns an empty array" do
  #       expect(['Sharon','Leo','Leila','Brian','Arun'].my_each { |friend| puts friend }).to eql(["Sharon", "Leo", "Leila", "Brian", "Arun"])
  #     end
  #   end
  # end
  # describe "#my_each" do
  #   context "print out friends" do
  #     it "returns an empty array" do
  #       expect(['Sharon','Leo','Leila','Brian','Arun'].my_each { |friend| puts friend }).to eql(["Sharon", "Leo", "Leila", "Brian", "Arun"])
  #     end
  #   end
  # end
  
end




# puts '6.--------my_none--------'
# puts(%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
# puts(%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
# puts %w[ant bear cat].my_none?(/d/) #=> true
# puts [1, 3.14, 42].my_none?(Float) #=> false
# puts [].my_none? #=> true
# puts [nil].my_none? #=> true
# puts [nil, false].my_none? #=> true
# puts [nil, false, true].my_none? #=> false
# puts %w[e dd].my_none?(/d/) # false
# puts [1, 2, 3].my_none?(3) # false
# puts  ["car","cat","dog"].my_none?("cat") #false
# puts [1,2,2].my_none?(3) #true

# puts '7.--------my_count--------'
# arr = [1, 2, 4, 2]
# puts arr.my_count #=> 4
# puts arr.my_count(2) #=> 2
# puts(arr.my_count { |x| (x % 2).zero? }) #=> 3

# puts '8.--------my_maps--------'
# my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
# puts(my_order.my_map { |item| item.gsub('medium', 'extra large') })
# puts((0..5).my_map { |i| i * i })
# puts 'my_map_proc'
# my_proc = proc { |i| i * i }
# puts (1..5).my_map(&my_proc)

# puts '8.--------my_inject--------'
# puts((1..5).my_inject { |sum, n| sum + n }) #=> 15
# puts(1..5).my_inject(1) { |product, n| product * n } #=> 120
# puts [2, 3].my_inject(20, :*) # should return 120
# puts [2, 3, 4].my_inject(:+) # should return 9
# longest = %w[ant bear cat].my_inject do |memo, word|
#   memo.length > word.length ? memo : word
# end
# puts longest #=> "bear"

# puts 'multiply_els'
# puts multiply_els([2, 4, 5]) #=> 40
