# frozen_string_literal: true

class LogParser
  def initialize(file_path)
    @file_path = file_path
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
