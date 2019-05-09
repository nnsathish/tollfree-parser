RSpec.describe TollfreeParser do
  it "has a version number" do
    expect(TollfreeParser::VERSION).not_to be nil
  end

  describe '.run' do
    subject { TollfreeParser.run(number) }
    context 'with valid number' do
      let(:number) { 2255 }
      it { is_expected.to eq ['CALL'] }
    end
    context 'with invalid number' do
      let(:number) { 633 }
      it { is_expected.to eq [] }
    end
  end
end
