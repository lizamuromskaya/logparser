# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe ViewsCounter do
  let(:pages) do
    { '/about' => ['061.945.150.735'],
      '/home' => ['184.123.665.067', '235.313.352.950'],
      '/about/2' => ['444.701.448.104', '444.701.448.104'],
      '/help_page/1' => ['722.247.931.582', '722.247.931.582', '722.247.931.582'] }
  end

  describe '#counter_most_views' do
    subject(:most_views_pages_counter) { described_class.new(pages).counter_most_views }

    let(:views) do
      { '/about' => 1,
        '/about/2' => 2,
        '/help_page/1' => 3,
        '/home' => 2 }
    end

    it 'returns an instance of PagesData' do
      expect(most_views_pages_counter).to eq views
    end
  end

  describe '#counter_uniq_views' do
    subject(:unique_views_pages_counter) { described_class.new(pages).counter_unique_views }

    let(:views) do
      { '/about' => 1,
        '/about/2' => 1,
        '/help_page/1' => 1,
        '/home' => 2 }
    end

    it 'returns an instance of PagesData' do
      expect(unique_views_pages_counter).to eq views
    end
  end
end
