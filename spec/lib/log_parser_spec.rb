# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe LogParser do
  subject(:logparser) { described_class.new(correct_file_path) }

  let(:correct_file_path) { 'spec/fixtures/webserver.log' }
  let(:expected_output_parsed_pages) do
    { '/about' => ['061.945.150.735'],
      '/about/2' => ['444.701.448.104', '444.701.448.104'],
      '/help_page/1' => ['722.247.931.582', '722.247.931.582', '722.247.931.582'],
      '/home' => ['184.123.665.067', '235.313.352.950'] }
  end

  describe '#parse' do
    it 'returns parsed pages' do
      expect(logparser.parse).to eq expected_output_parsed_pages
    end
  end
end
