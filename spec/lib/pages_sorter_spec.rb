# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe PagesSorter do
  let(:correct_file_path) { 'spec/fixtures/webserver.log' }
  let(:pages) do
    { '/about' => ['061.945.150.735'],
      '/home' => ['184.123.665.067', '235.313.352.950'],
      '/about/2' => ['444.701.448.104', '444.701.448.104'],
      '/help_page/1' => ['722.247.931.582', '722.247.931.582', '722.247.931.582'] }
  end
  let(:pages_sorter) { described_class.new(pages) }
  let(:expected_output_parsed_pages) do
    { '/about' => ['061.945.150.735'],
      '/about/2' => ['444.701.448.104', '444.701.448.104'],
      '/help_page/1' => ['722.247.931.582', '722.247.931.582', '722.247.931.582'],
      '/home' => ['184.123.665.067', '235.313.352.950'] }
  end

  describe '#most_views' do
    let(:expected_output_most_views) { PagesData.new(['/help_page/1', '/about/2', '/home', '/about'], false) }

    it 'returns array of most views pages' do
      expect(pages_sorter.most_views.views_pages).to eq expected_output_most_views.views_pages
    end

    it 'returns false' do
      expect(pages_sorter.most_views.task_uniq).to eq expected_output_most_views.task_uniq
    end
  end

  describe '#uniq_views' do
    let(:expected_output_unique_views) { PagesData.new(['/home', '/help_page/1', '/about/2', '/about'], true) }

    it 'returns an array of most unique views pages' do
      expect(pages_sorter.unique_views.views_pages).to eq expected_output_unique_views.views_pages
    end

    it 'returns true' do
      expect(pages_sorter.unique_views.task_uniq).to eq expected_output_unique_views.task_uniq
    end
  end
end
