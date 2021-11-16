# frozen_string_literal: true

RSpec.shared_examples 'file raises an error' do
  it 'raises an error' do
    expect { subject }.to raise_error(RuntimeError, error_message)
  end
end
