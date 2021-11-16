# frozen_string_literal: true

require_relative 'lib/log_parser'
require_relative 'lib/task_output'
require_relative 'lib/validations/file_validations'

file_validations = FileValidations.new
log_output = TaskOutput.new
parser = LogParser.new(ARGV[0], file_validations)

puts 'Most views pages'
pages = parser.parse
views_pages = parser.most_views(pages)
puts log_output.output(views_pages, pages)

puts "\r"
puts 'Unique page views'
views_pages = parser.unique_views(pages)
puts log_output.output(views_pages, pages)
