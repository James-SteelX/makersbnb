require_relative '../app/lib/send_text'

describe TextMessage do

  subject(:textmessage) { described_class.new }
  let(:name) {"Terry"}
  let(:city) {"London"}
  let(:start_date) {"14/04/2017"}
  let(:mobile_number) {"07123456789"}
  before do
    allow(textmessage).to receive(:send).with(mobile_number, city, start_date, name)

  end

  # it 'sends a confirmation text message' do
  #   expect(textmessage.send(mobile_number, city, start_date, name)).to eq "Hello Terry, your reservation in London for 14/02/2017 has been confirmed."
  # end
end
