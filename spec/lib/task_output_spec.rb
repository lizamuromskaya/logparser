# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/log_parser'
require_relative '../../lib/task_output'

RSpec.describe TaskOutput do
  let(:task_output_item) { described_class.new }
  let(:correct_file_path) { 'spec/fixtures/webserver.log' }
  let(:file_validations) { FileValidations.new }
  let(:struct) { Struct.new(:views_pages, :task_uniq) }
  let(:pages) do
    { '/about' => ['061.945.150.735'], '/home' => ['184.123.665.067', '235.313.352.950'],
      '/about/2' => ['444.701.448.104', '444.701.448.104'], '/help_page/1' => ['722.247.931.582',
                                                                               '722.247.931.582', '722.247.931.582'] }
  end

  let(:most_views_pages) { struct.new(['/help_page/1', '/about/2', '/home', '/about'], false) }
  let(:unique_views_pages) { struct.new(['/home', '/help_page/1', '/about/2', '/about'], true) }

  let(:expected_formatted_output) do
    ['     Page      | Views', '/help_page/1   |   3', '/about/2       |   2', '/home          |   2',
     '/about         |   1']
  end

  let(:expected_formatted_output_for_unique) do
    ['     Page      | Views', '/home          |   2', '/help_page/1   |   1', '/about/2       |   1',
     '/about         |   1']
  end

  describe '#output' do
    it 'returns formatted data for most views pages' do
      expect(task_output_item.output(most_views_pages, pages)).to eq expected_formatted_output
    end

    it 'returns formatted data for unuque views pages' do
      expect(task_output_item.output(unique_views_pages, pages)).to eq expected_formatted_output_for_unique
    end
  end
end
