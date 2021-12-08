# frozen_string_literal: true

class ViewsCounter
  attr_reader :views

  def initialize(pages)
    @pages = pages
    @views = {}
  end

  def counter_most_views
    @pages.each_key do |page|
      @views[page] = @pages[page].size
    end
    @views
  end

  def counter_unique_views
    @pages.each_key do |page|
      @views[page] = @pages[page].uniq.size
    end
    @views
  end
end
