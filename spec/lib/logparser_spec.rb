# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../lib/logparser'

RSpec.describe LogParser do
  let(:correct_file_path) { 'spec/fixtures/webserver.log' }
  let(:file_validations) { FileValidations.new }
  let(:log_output) { TaskOutput.new }
  let(:expected_output_most_views) do
    ['     Page      | Views', '/help_page/1   |   3', '/about/2       |   2', '/home          |   2',
     '/about         |   1']
  end
  let(:expected_output_unique_views) do
    ['     Page      | Views', '/home          |   2', '/help_page/1   |   1', '/about/2       |   1',
     '/about         |   1']
  end
  subject { described_class.new(correct_file_path, file_validations, log_output) }

  describe '#most_views' do
    it 'output most views pages' do
      expect(subject.most_views).to eq expected_output_most_views
    end
  end
  describe '#uniq_views' do
    it 'output most unique views pages' do
      expect(subject.unique_views).to eq expected_output_unique_views
    end
  end
end
