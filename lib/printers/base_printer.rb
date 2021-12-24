# frozen_string_literal: true

class BasePrinter
  def print_views
    raise NotImplementedError
  end

  def print_header
    raise NotImplementedError
  end
end
