# frozen_string_literal: true

require_relative 'lib/log_parser'
require_relative 'lib/logparser_runner'
require_relative 'lib/pages_sorter'
require_relative 'lib/views_counter'
require_relative 'lib/printers/base_printer'
require_relative 'lib/printers/print_unique_views'
require_relative 'lib/printers/print_most_views'
require_relative 'lib/pages_data'
require_relative 'lib/printers/log_printer_factory'
require_relative 'lib/validations/file_validator'

LogparserRunner.new(ARGV[0]).run
