# rubocop: disable Metrics/BlockLength, Metrics/LineLength
require_relative '../lib/enum'

describe Enumerable do
  describe " \n #my_each \n" do
    context "given an array \n" do
      it 'prints each element in the array' do
        actual = %w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend }
        expected = %w[Sharon Leo Leila Brian Arun]
        expect(actual).to eql(expected)
      end
    end
  end

  describe '#my_each_with_index' do
    context 'given an array' do
      it 'prints out even-indexed elements' do
        actual = %w[Sharon Leo Leila Brian Arun].my_each_with_index do |friend, index|
          friend if index.even?
        end
        expected = %w[Sharon Leo Leila Brian Arun].each_with_index { |friend, index| friend if index.even? }
        expect(actual).to eql(expected)
      end
    end
  end
  describe '#my_select' do
    context 'selects out friends who meet the condition' do
      it 'prints elements that meet the condition' do
        expect(%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' }).to eql(%w[Sharon Leo Leila Arun])
      end
    end
  end

  describe '#my_all' do
    context 'print out true or false depending if all elements meet the condition' do
      it 'returns true if all elements length is bigger or equal to 3' do
        expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
      end
      it 'returns true if all elements length is bigger or equal to 4' do
        expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }).to eql(false)
      end
      it 'returns true if all elements meet this condition' do
        expect(%w[ant bear cat].my_all?(/t/)).to eql(false)
      end
      it 'returns true if all elements are Numeric' do
        expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
      end
      it 'returns true' do
        expect([].my_all?).to eql(true)
      end
      it 'returns true if all elements equals 3' do
        expect([1, 2, 3].my_all?(3)).to eql(false)
      end
      it 'returns true' do
        expect([1, 2, 3].my_all?).to eql(true)
      end
    end
  end
  describe '#my_any' do
    context 'print out true or false if any element meet the given condition' do
      it 'returns true if any element length is equal to or bigger than 3' do
        expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eql(true)
      end
      it 'returns true if any element length is equal to or bigger than 4' do
        expect(%w[ant bear cat].my_any? { |word| word.length >= 4 }).to eql(true)
      end
      it 'returns true if any element meet the conditon' do
        expect(%w[ant bear cat].my_any?(/d/)).to eql(false)
      end
      it 'returns true if any element is an integer' do
        expect([nil, true, 99].my_any?(Integer)).to eql(true)
      end
      it 'returns true' do
        expect([nil, true, 99].my_any?).to eql(true)
      end
      it 'returns true if any element meet the condition' do
        expect([].my_any?).to eql(false)
      end
      it 'returns true if any element equals 3' do
        expect([1, 2, 3].my_any?(3)).to eql(true)
      end
      it 'returns true if any element meet the condition' do
        expect(%w[e dd].my_any?(/d/)).to eql(true)
      end
      it "returns true if any element equals 'cat' " do
        expect(%w[car cat dog].my_any?('cat')).to eql(true)
      end
    end
  end
  describe '#my_none' do
    context 'print out true or false if none or some of the elements meet the condition' do
      it 'return true if none of the elements length equals 5' do
        expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eql(true)
      end
      it 'return true if none of the elements length equals 4' do
        expect(%w[ant bear cat].my_none? { |word| word.length == 4 }).to eql(false)
      end
      it 'return true if none of the elements meet the conditions' do
        expect(%w[ant bear cat].my_none?(/d/)).to eql(true)
      end
      it 'return true if none of the elements is a float' do
        expect([1, 3.14, 42].my_none?(Float)).to eql(false)
      end
      it 'return true if none of the element meet the condition' do
        expect([].my_none?).to eql(true)
      end
      it 'return true if none of the element meet the condition' do
        expect([nil].my_none?).to eql(true)
      end
      it 'return true if none of the element meet the condition' do
        expect([nil, false].my_none?).to eql(true)
      end
      it 'return true if none of the element meet the condition' do
        expect([nil, false, true].my_none?).to eql(false)
      end
      it 'return true if none of the element meet the condition' do
        expect(%w[e dd].my_none?(/d/)).to eql(false)
      end
      it 'return true if none of the element equals 3' do
        expect([1, 2, 3].my_none?(3)).to eql(false)
      end
      it "return true if none of the element equals 'cat' " do
        expect(%w[car cat dog].my_none?('cat')).to eql(false)
      end
      it 'return true if none of the element equals 3 ' do
        expect([1, 2, 2].my_none?(3)).to eql(true)
      end
    end
  end

  describe 'my_count' do
    context "\ngiven an array, Count how many elements in the array that meets the condition\n" do
      it 'returns the count of numbers that meets condition' do
        expect([1, 2, 4, 2].my_count(2)).to eql(2)
      end
      it 'returns the count of numbers that meets condition' do
        expect([1, 2, 4, 2].my_count).to eql(4)
      end
      it 'returns the count of numbers that meets condition' do
        expect([1, 2, 4, 2].my_count { |n| (n % 2).zero? }).to eql(3)
      end
    end
  end

  describe 'my_map' do
    context 'given an array, Map through each element' do
      it 'map through an array and change each element from medium to large' do
        expect(['medium Big Mac', 'medium fries', 'medium milkshake'].my_map { |item| item.gsub('medium', 'extra large') }).to eql(['medium Big Mac', 'medium fries', 'medium milkshake'].map { |item| item.gsub('medium', 'extra large') })
      end
      it 'multiply each element in the range' do
        expect((0..5).my_map { |i| i * i }).to eql((0..5).my_map { |i| i * i })
      end
    end
    context 'given a proc as a block' do
      it 'multiply each element in the range' do
        my_proc = proc { |i| i * i }
        expect((1..5).my_map(&my_proc)).to eql((1..5).map(&my_proc))
      end
    end
  end

  describe '#my_inject' do
    context 'given different symbols and blocks, return the sum of the array' do
      it 'return the added sum value of the range' do
        expect((1..5).my_inject { |sum, n| sum + n }).to eql(15)
      end
      it 'return the multipled sum of the range' do
        expect((1..5).my_inject(1) { |product, n| product * n }).to eql(120)
      end
      it 'return the multipled sum of the range with 20 as the initial accumlator' do
        expect([2, 3].my_inject(20, :*)).to eql(120)
      end
      it 'return the sum value of the array' do
        expect([2, 3, 4].my_inject(:+)).to eql(9)
      end
      it 'return the word with largest length' do
        expect(%w[ant bear cat].my_inject { |memo, word| memo.length > word.length ? memo : word }).to eql('bear')
      end
    end
  end
end
# rubocop: enable Metrics/BlockLength, Metrics/LineLength
