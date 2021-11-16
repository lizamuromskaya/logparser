# frozen_string_literal: true

class TaskOutput
  def output(views_pages_struct, pages)
    result = []
    big_page_size = views_pages_struct[:views_pages].max_by(&:length).size + 3
    count_of_spaces_before_page = (big_page_size / 2) - 2
    count_of_spaces_after_page = big_page_size - count_of_spaces_before_page - 4
    result << "#{' ' * count_of_spaces_before_page}Page#{' ' * count_of_spaces_after_page}| Views"
    tasks_output(result, views_pages_struct, big_page_size,
                 pages)
    result
  end

  private

  def output_uniq_views(result, views_pages, big_page_size, pages)
    views_pages.each do |page|
      column_page_size = big_page_size - page.size
      result << "#{page}#{' ' * column_page_size}|   #{pages[page].uniq.size}"
    end
  end

  def output_most_views(result, views_pages, big_page_size, pages)
    views_pages.each do |page|
      column_page_size = big_page_size - page.size
      result << "#{page}#{' ' * column_page_size}|   #{pages[page].size}"
    end
  end

  def tasks_output(result, views_pages_struct, big_page_size,
                   pages)
    task_unique = views_pages_struct[:task_uniq]
    views_pages = views_pages_struct[:views_pages]
    if task_unique
      output_uniq_views(result, views_pages, big_page_size,
                        pages)
    else
      output_most_views(result, views_pages, big_page_size, pages)
    end
  end
end
