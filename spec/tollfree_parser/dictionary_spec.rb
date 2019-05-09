RSpec.describe TollfreeParser::Dictionary do
  let!(:dict) { TollfreeParser::Dictionary.new }

  describe '#initialize' do
    subject(:dict) { TollfreeParser::Dictionary.new }
    it do
      is_expected.not_to be_nil
      expect(dict.words).to eq({})
    end
  end

  describe '#add' do
    subject { dict.add(word) }
    context 'with blank word' do
      let(:word) { nil }
      it do
        is_expected.to be_nil
        expect(dict.words).to eq({})
      end
    end
    context 'with a valid word' do
      let(:word) { 'CALL' }
      it do
        is_expected.not_to be_nil
        expect(dict.words).to eq({'CALL' => 1 })
      end
    end
    context 'when adding a duplicate word' do
      let(:word) { 'FLOWER' }
      before { dict.add(word) }
      it do
        is_expected.not_to be_nil
        expect(dict.words).to eq({'FLOWER' => 1 })
      end
    end
  end

  describe '#load_defaults!' do
    subject { dict.load_defaults! }
    context 'with valid defaults' do
      it do
        is_expected.not_to be_nil
        expect(dict.words).not_to be_empty
        # Can't assert the exact match as the test-case shares the actual data - Not a good design
      end
    end
  end
end
