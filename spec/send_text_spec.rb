require_relative '../app/lib/send_text'

describe TextMessage do

  let(:name) {"Terry"}
  let(:city) {"London"}
  let(:start_date) {"14/04/2017"}
  let(:mobile_number) {"07700900125"}
  before do
    allow(described_class.send).to receive(mobile_number, city, start_date, name)

  end

  # it 'sends a confirmation text message' do
  #   expect(described_class.send(mobile_number, city, start_date, name)).to receive(:send_text).with("Hello Terry, your reservation in London for 14/04/2017 has been confirmed.")
  # end
end
