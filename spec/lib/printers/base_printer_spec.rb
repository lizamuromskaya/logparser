# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe BasePrinter do
  subject(:printer) { described_class.new }

  describe '#print_views' do
    it 'returns NotImplementedError' do
      expect { printer.print_views }.to raise_error(NotImplementedError)
    end
  end

  describe '#print_header' do
    it 'returns NotImplementedError' do
      expect { printer.print_header }.to raise_error(NotImplementedError)
    end
  end
end
