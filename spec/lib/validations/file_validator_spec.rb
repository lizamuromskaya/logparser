# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe FileValidator do
  describe '#validate_file' do
    subject(:validations_rules) { described_class.new.validate(file_path) }

    context 'when file is correct' do
      let(:file_path) { 'spec/fixtures/webserver.log' }

      before do
        allow(described_class).to receive(:new).and_return(validations_rules)
      end

      it 'does not raise an error' do
        expect { validations_rules }.not_to raise_error
      end
    end

    context 'with non-existent file' do
      let(:file_path) { 'spec/fixtures/web.log' }
      let(:error_message) { "No such file or directory @ #{file_path}" }

      it 'raises an error about non-existent file' do
        expect { validations_rules }.to raise_error(RuntimeError, error_message)
      end
    end

    context 'with empty file' do
      let(:file_path) { 'spec/fixtures/emptywebserver.log' }
      let(:error_message) { "File is empty @ #{file_path}" }

      it 'raises an error about empty file' do
        expect { validations_rules }.to raise_error(RuntimeError, error_message)
      end
    end

    context 'with wrong file format' do
      let(:file_path) { 'spec/fixtures/webserver.lg' }
      let(:error_message) { "Wrong file format @ #{file_path}" }

      it 'raises an error about file format' do
        expect { validations_rules }.to raise_error(RuntimeError, error_message)
      end
    end
  end
end
