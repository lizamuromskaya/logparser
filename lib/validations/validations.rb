# frozen_string_literal: true

class FileValidations
  FILE_EXTENSION = '.log'
  def validate_file(file_path)
    right_file_format?(file_path)
    file_exists?(file_path)
    file_not_empty?(file_path)
  end

  private

  def file_exists?(file_path)
    return if File.exist? file_path

    raise "No such file or directory @ #{file_path}"
  end

  def file_not_empty?(file_path)
    return unless File.zero? file_path

    raise "File is empty @ #{file_path}"
  end

  def right_file_format?(file_path)
    return if File.extname(file_path) == FILE_EXTENSION

    raise "Wrong file format @ #{file_path}"
  end
end
