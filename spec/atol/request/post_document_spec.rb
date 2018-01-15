require 'net/http'
require './lib/atol/request/post_document'

describe Atol::Request::PostDocument do
  it { expect(described_class).to be_a Class }

  let(:config) { Atol::Config.new(overrides: { group_code: 'group_code_example' }) }
  let(:token) { 'token_example' }
  let(:body) { '{"json": "example"}' }
  let(:base_params) { Hash[token: token, body: body, config: config] }

  describe '#new' do
    context 'when given existing operation' do
      it 'sell' do
        params = base_params.merge(operation: 'sell')
        expect { described_class.new(params) }.not_to raise_error
      end

      it 'sell_refund' do
        params = base_params.merge(operation: 'sell_refund')
        expect { described_class.new(params) }.not_to raise_error
      end

      it 'sell_correction' do
        params = base_params.merge(operation: 'sell_correction')
        expect { described_class.new(params) }.not_to raise_error
      end

      it 'buy' do
        params = base_params.merge(operation: 'buy')
        expect { described_class.new(params) }.not_to raise_error
      end

      it 'buy_refund' do
        params = base_params.merge(operation: 'buy_refund')
        expect { described_class.new(params) }.not_to raise_error
      end

      it 'buy_correction' do
        params = base_params.merge(operation: 'buy_correction')
        expect { described_class.new(params) }.not_to raise_error
      end
    end

    context 'when given not existing operation' do
      let(:not_existing_operation) { :kill_all_humans }
      let(:params) { base_params.merge(operation: not_existing_operation) }
      it { expect { described_class.new(params) }.to raise_error(Atol::UnknownOperationError) }
    end
  end

  describe '#call' do
    before do
      stub_request(:post, 'http://online.atol.ru:443/possystem/v3/group_code_example/sell?token_id=token_example')
        .to_return(status: 200, body: '', headers: {})
    end

    it 'call return result of http request' do
      params = base_params.merge(operation: :sell)
      request = described_class.new(params)
      response = request.call
      expect(response.code).to eql '200'
    end
  end
end
