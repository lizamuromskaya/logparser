# frozen_string_literal: true

require_relative 'lib/log_parser'
require_relative 'lib/pages_sorter'
require_relative 'lib/printers/base_printer'
require_relative 'lib/printers/print_unique_views'
require_relative 'lib/printers/print_most_views'
require_relative 'lib/pages_data'
require_relative 'lib/printers/log_printer_factory'
require_relative 'lib/validations/file_validator'

FileValidator.new.validate(ARGV[0])

parser = LogParser.new(ARGV[0])
pages = parser.parse
sorted_pages = PagesSorter.new(pages)

views_pages_obj = sorted_pages.most_views
printer = LogPrinterFactory.for(views_pages_obj, pages)
puts printer.print_views

views_pages_obj = sorted_pages.unique_views
printer = LogPrinterFactory.for(views_pages_obj, pages)
puts printer.print_views
