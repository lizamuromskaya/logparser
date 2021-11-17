# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe PrintMostViews do
  let(:views_pages_obj) { PagesData.new(['/help_page/1', '/about/2', '/home', '/about'], false) }
  let(:pages) do
    { '/about' => ['061.945.150.735'],
      '/home' => ['184.123.665.067', '235.313.352.950'],
      '/about/2' => ['444.701.448.104', '444.701.448.104'],
      '/help_page/1' => ['722.247.931.582', '722.247.931.582', '722.247.931.582'] }
  end
  let(:printer) { LogPrinterFactory.for(views_pages_obj, pages) }
  let(:expected_formatted_output) do
    ['List with most page views', '     Page      | Views', '/help_page/1   |   3', '/about/2       |   2',
     '/home          |   2', '/about         |   1']
  end

  describe '#print_views' do
    it 'returns list with most page views' do
      expect(printer.print_views).to eq expected_formatted_output
    end
  end
end
