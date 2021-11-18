# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe PrintUniqueViews do
  let(:views_pages_obj) { PagesData.new(['/home', '/help_page/1', '/about/2', '/about'], true) }
  let(:pages) do
    { '/about' => ['061.945.150.735'],
      '/home' => ['184.123.665.067', '235.313.352.950'],
      '/about/2' => ['444.701.448.104', '444.701.448.104'],
      '/help_page/1' => ['722.247.931.582', '722.247.931.582', '722.247.931.582'] }
  end
  let(:printer) { LogPrinterFactory.for(views_pages_obj, pages) }
  let(:expected_formatted_output) do
    ['List with most unique page views', '     Page      | Views', '/home          |   2', '/help_page/1   |   1',
     '/about/2       |   1', '/about         |   1']
  end

  describe '#print_views' do
    it 'returns list with most unique page views' do
      expect(printer.print_views).to eq expected_formatted_output
    end
  end
end
