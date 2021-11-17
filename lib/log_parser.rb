# frozen_string_literal: true

class LogParser
  def initialize(file_path, file_validations)
    file_validations.validate_file(file_path)
    @file_path = file_path
    @views_struct = Struct.new(:views_pages, :task_uniq)
  end

  def most_views(pages)
    views_pages = pages.keys.sort_by { |key| pages[key].size }.reverse
    task_uniq = false
    @views_struct.new(views_pages, task_uniq)
  end

  def unique_views(pages)
    views_pages = pages.keys.sort_by { |key| pages[key].uniq.size }.reverse
    task_uniq = true
    @views_struct.new(views_pages, task_uniq)
  end

  def parse
    pages_with_ip = Hash.new { |h, key| h[key] = [] }
    lines = read_file
    lines.each do |line|
      temp_page, temp_ip = line.split(/\s+/)
      pages_with_ip[temp_page] << temp_ip
    end

    pages_with_ip
  end

  private

  def read_file
    lines = []
    File.open(@file_path, 'r').each do |line|
      lines << line.chomp
    end

    lines
  end
end
