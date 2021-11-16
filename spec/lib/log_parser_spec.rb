# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/log_parser'

RSpec.describe LogParser do
  let(:correct_file_path) { 'spec/fixtures/webserver.log' }
  let(:file_validations) { FileValidations.new }
  let(:logparser) { described_class.new(correct_file_path, file_validations) }
  let(:struct) { Struct.new(:views_pages, :task_uniq) }
  let(:pages) do
    { '/about' => ['061.945.150.735'], '/home' => ['184.123.665.067', '235.313.352.950'],
      '/about/2' => ['444.701.448.104', '444.701.448.104'], '/help_page/1' => ['722.247.931.582',
                                                                               '722.247.931.582', '722.247.931.582'] }
  end

  describe '#most_views' do
    let(:expected_output_most_views) { struct.new(['/help_page/1', '/about/2', '/home', '/about'], false) }

    it 'returns array of most views pages' do
      expect(logparser.most_views(pages)[:views_pages]).to eq expected_output_most_views[:views_pages]
    end

    it 'returns false' do
      expect(logparser.most_views(pages)[:task_uniq]).to eq expected_output_most_views[:task_uniq]
    end
  end

  describe '#uniq_views' do
    let(:expected_output_unique_views) { struct.new(['/home', '/help_page/1', '/about/2', '/about'], true) }

    it 'returns an array of most unique views pages' do
      expect(logparser.unique_views(pages)[:views_pages]).to eq expected_output_unique_views[:views_pages]
    end

    it 'returns true' do
      expect(logparser.unique_views(pages)[:task_uniq]).to eq expected_output_unique_views[:task_uniq]
    end
  end

  describe '#parse' do
    let(:expected_output_parsed_pages) do
      { '/about' => ['061.945.150.735'],
        '/about/2' => ['444.701.448.104', '444.701.448.104'],
        '/help_page/1' => ['722.247.931.582', '722.247.931.582', '722.247.931.582'],
        '/home' => ['184.123.665.067', '235.313.352.950'] }
    end

    it 'returns parsed pages' do
      expect(logparser.parse).to eq expected_output_parsed_pages
    end
  end
end
