# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe PrintMostViews do
  subject(:printer) { LogPrinterFactory.for(views_pages_obj, views_count) }

  let(:views_pages_obj) { PagesData.new(['/help_page/1', '/about/2', '/home', '/about'], false) }
  let(:expected_formatted_output) do
    ['List with most page views', '     Page      | Views', '/help_page/1   |   3', '/about/2       |   2',
     '/home          |   2', '/about         |   1']
  end
  let(:views_count) do
    { '/help_page/1' => 3, '/home' => 2, '/about/2' => 2, '/about' => 1 }
  end

  describe '#print_views' do
    it 'returns list with most page views' do
      expect(printer.print_views).to eq expected_formatted_output
    end
  end
end
