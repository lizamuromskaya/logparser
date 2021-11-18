# frozen_string_literal: true

class PagesData
  attr_accessor :views_pages, :task_uniq

  def initialize(views_pages, task_uniq)
    @views_pages = views_pages
    @task_uniq = task_uniq
  end
end
