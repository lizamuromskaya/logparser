# frozen_string_literal: true

require_relative 'output'

class LogParser
  attr_reader :pages_with_ip

  def initialize(file_path, file_validations, log_output)
    file_validations.validate_file(file_path)
    @file_path = file_path
    @log_output = log_output
    @pages_with_ip = Hash.new { |h, key| h[key] = [] }
  end

  def most_views
    pages = parse
    most_views_pages = pages.keys.sort_by { |key| pages[key].size }.reverse
    task_uniq = false
    @log_output.output(most_views_pages, task_uniq, pages)
  end

  def unique_views
    pages = parse
    unique_views_pages = pages.keys.sort_by { |key| pages[key].uniq.size }.reverse
    task_uniq = true
    @log_output.output(unique_views_pages, task_uniq, pages)
  end

  private

  def read_file
    lines = []
    File.open(@file_path, 'r').each do |line|
      lines << line.chomp
    end

    lines
  end

  def parse
    return @pages_with_ip if @pages_with_ip.any?

    lines = read_file
    lines.each do |line|
      temp_page, temp_ip = line.split(/\s+/)
      @pages_with_ip[temp_page] << temp_ip
    end
    @pages_with_ip
  end
end
