RSpec.describe TollfreeParser::KeyboardLayout do
  let!(:new_kb_layout) { TollfreeParser::KeyboardLayout.new }
  let!(:default_kb_layout) { TollfreeParser::KeyboardLayout.new.load_defaults! }

  describe '#initialize' do
    it { expect(TollfreeParser::KeyboardLayout.new.map).to eq({}) }
  end

  describe '#add' do
    subject { new_kb_layout.add(number, chars) }
    let(:number) { 1 }
    context 'when chars is nil' do
      let(:chars) { nil }
      it do
        is_expected.to be_nil
        expect(new_kb_layout.map).to eq({ 1 => nil })
      end
    end
    context 'when chars is a string' do
      let(:chars) { 'a,b' }
      it do
        is_expected.not_to be_nil
        expect(new_kb_layout.map).to eq({ 1 => ['a', 'b'] })
      end
    end
    context 'when chars is an array' do
      let(:chars) { ['e', 'f'] }
      it do
        is_expected.not_to be_nil
        expect(new_kb_layout.map).to eq({ 1 => ['e', 'f'] })
      end
    end
  end

  describe '#get_letters' do
    subject { default_kb_layout.get_letters(number) }
    context 'when nil is mapped for the number' do
      let(:number) { 1 }
      it { is_expected.to eq(['1']) }
    end
    context 'when no chars are mapped for the number' do
      let(:number) { 9 }
      it { is_expected.to eq(['9']) }
    end
    context 'when valid chars are mapped' do
      let(:number) { 3 }
      it { is_expected.to eq(['d', 'e', 'f']) }
    end
  end

  describe '#find_number' do
    subject { default_kb_layout.find_number(char) }
    context 'when char is not in the map' do
      let(:char) { 'z' }
      it { is_expected.to be_nil }
    end
    context 'with a mapped char' do
      let(:char) { 'b' }
      it { is_expected.to eq(2) }
    end
    context 'when char is a number' do
      let(:char) { '0' }
      it { is_expected.to eq(0) }
    end
  end

  describe '#load_defaults!' do
    subject { new_kb_layout.load_defaults! }
    context 'with valid defaults' do
      it do
        is_expected.not_to be_nil
        expect(new_kb_layout.map).not_to be_empty
      end
    end
  end
end
