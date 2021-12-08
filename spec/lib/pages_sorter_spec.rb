# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe PagesSorter do
  let(:pages) do
    { '/about' => ['061.945.150.735'],
      '/home' => ['184.123.665.067', '235.313.352.950'],
      '/about/2' => ['444.701.448.104', '444.701.448.104'],
      '/help_page/1' => ['722.247.931.582', '722.247.931.582', '722.247.931.582'] }
  end

  describe '#most_views' do
    subject(:most_views_pages_sorter) { described_class.new(pages).most_views }

    it 'returns an instance of PagesData' do
      expect(most_views_pages_sorter).to be_an_instance_of(PagesData)
    end

    it 'checks for object attribute and proper values' do
      expect(most_views_pages_sorter).to have_attributes(views_pages: ['/help_page/1', '/about/2', '/home', '/about'],
                                                         task_uniq: false)
    end
  end

  describe '#uniq_views' do
    subject(:unique_views_pages_sorter) { described_class.new(pages).unique_views }

    it 'returns an instance of PagesData' do
      expect(unique_views_pages_sorter).to be_an_instance_of(PagesData)
    end

    it 'checks for object attribute and proper values' do
      expect(unique_views_pages_sorter).to have_attributes(views_pages: ['/home', '/help_page/1', '/about/2', '/about'],
                                                           task_uniq: true)
    end
  end
end
