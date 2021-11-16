# frozen_string_literal: true

require_relative 'lib/logparser'
require_relative 'lib/validations/validations'

file_validations = FileValidations.new
log_output = TaskOutput.new
parser = LogParser.new(ARGV[0], file_validations, log_output)

puts 'Most views pages'
puts parser.most_views

puts "\r"
puts 'Unique page views'
puts parser.unique_views
