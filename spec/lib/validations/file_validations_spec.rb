# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../lib/validations/file_validations'

RSpec.describe FileValidations do
  let(:validations_rules) { described_class.new.validate_file(file_path) }

  describe '#validate_file' do
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

      include_examples 'file raises an error'
    end

    context 'with empty file' do
      let(:file_path) { 'spec/fixtures/emptywebserver.log' }
      let(:error_message) { "File is empty @ #{file_path}" }

      include_examples 'file raises an error'
    end

    context 'with wrong file format' do
      let(:file_path) { 'spec/fixtures/webserver.lg' }
      let(:error_message) { "Wrong file format @ #{file_path}" }

      include_examples 'file raises an error'
    end
  end
end
