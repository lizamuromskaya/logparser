# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe PrintUniqueViews do
  subject(:printer) { LogPrinterFactory.for(views_pages_obj, views_count) }

  let(:views_pages_obj) { PagesData.new(['/home', '/help_page/1', '/about/2', '/about'], true) }
  let(:expected_formatted_output) do
    ['List with most unique page views', '     Page      | Views', '/home          |   2', '/help_page/1   |   1',
     '/about/2       |   1', '/about         |   1']
  end
  let(:views_count) do
    { '/help_page/1' => 1, '/home' => 2, '/about/2' => 1, '/about' => 1 }
  end

  describe '#print_views' do
    it 'returns list with most unique page views' do
      expect(printer.print_views).to eq expected_formatted_output
    end
  end
end
