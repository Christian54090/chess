# spec/chess_spec.rb
require 'chess'
require 'pieces'

describe Chess do

  describe 'convert' do

    context "given an invalid string" do
      it { expect(Chess.convert('Z5')).to eql('invalid') }
    end

    context "given a valid string" do
      it { expect(Chess.convert('A5')).to eql([6,2]) }
    end

  end
=begin
  describe 'clear?' do

  end

  describe 'in_bounds?' do

    context 'given an invalid array' do
      it { expect(in_bounds?([9,1])).to eql(false) }
    end

    context 'given a valid array' do
      it { expect(in_bounds?([1,1])).to eql(true) }
    end

  end
=end
end
