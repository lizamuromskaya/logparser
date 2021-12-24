# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe LogparserRunner do
  subject(:runner) { described_class.new(correct_file_path) }

  let(:correct_file_path) { 'spec/fixtures/webserver.log' }

  it 'does not raise an error' do
    expect { runner.run }.not_to raise_error
  end
end
