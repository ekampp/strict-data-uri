# frozen_string_literal: true

RSpec.describe Strict::Data::Uri do
  let(:encoded_string) { "data:text/plain;base64,SUQsTmFtZSxUaXRsZQoxLEFsaWNlLE1zCjIsQm9iLE1yCjMsQ2hhcmxpZSxNcgo0LERlbGFpbGEsTXMKNSxFcml4LE1yCg==" } # rubocop:disable Layout/LineLength
  let(:decoded_string) do
    <<~CSV
      ID,Name,Title
      1,Alice,Ms
      2,Bob,Mr
      3,Charlie,Mr
      4,Delaila,Ms
      5,Erix,Mr
    CSV
  end

  it "has a version number" do
    expect(Strict::Data::Uri::VERSION).not_to be nil
  end

  describe ".encode" do
    subject(:encode) { described_class.encode decoded_string }

    it { is_expected.to eql encoded_string }
  end

  describe ".decode" do
    subject(:decode) { described_class.decode encoded_string }

    it { is_expected.to eql decoded_string }

    context "with invalid URI" do
      let(:encoded_string) { "abc" }

      it { expect { decode }.to raise_error Strict::Data::Uri::InvalidDataUri }
    end

    context "with invalid encoder" do
      let(:encoded_string) { "data:text/plain;ivalid,SUQsT" }

      it { expect { decode }.to raise_error Strict::Data::Uri::InvalidEncoder }
    end
  end
end
