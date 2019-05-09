RSpec.describe TollfreeParser::Base do

  describe "#parse" do
    subject do
      base = TollfreeParser::Base.new
      base.keyboard_layout.load_defaults!
      %w(call flower me know ball).each do |word|
        base.dictionary.add(word.upcase)
      end
      base.parse(number)
    end

    context 'with an invalid number' do
      let(:number) { 1234567 }
      it { is_expected.to be_empty }
    end
    context 'when part of the number is valid' do
      let(:number) { 2255123 }
      it { is_expected.to be_empty }
    end
    context 'with matched words and a number at the start' do
      let(:number) { 12255 }
      it { is_expected.to be_empty }
    end
    context 'with matched words and a number at the end' do
      let(:number) { 639 }
      it { is_expected.to be_empty }
    end
    context 'with matched words and multiple numbers in-between' do
      let(:number) { 22559963 }
      it { is_expected.to be_empty }
    end
    context 'with a valid number' do
      context 'when whole word matches' do
        let(:number) { 2255 }
        it { is_expected.to match_array(%w(CALL BALL)) }
      end
      context 'when multiple partial words are matched' do
        let(:number) { 225563 }
        it { is_expected.to match_array(%w(CALLME BALLME)) }
      end
      context 'when multiple words are matched with a number in-between' do
        let(:number) { 2255863 }
        it { is_expected.to match_array(%w(CALL8ME BALL8ME)) }
      end
      context 'when words repeat after the number' do
        let(:number) { 225506363 }
        it { is_expected.to match_array(%w(CALL0MEME BALL0MEME)) }
      end
      context 'when words repeat without the number' do
        let(:number) { 22556363 }
        it { is_expected.to match_array(%w(CALLMEME BALLMEME)) }
      end
    end
  end
end
