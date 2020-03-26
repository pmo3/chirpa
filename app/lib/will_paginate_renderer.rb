# frozen_string_literal: true

class WillPaginateRenderer < WillPaginate::ActionView::LinkRenderer
  def page_number(page)
    if page == current_page
      tag(:span, page, class: "px-4 py-2 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:shadow-outline-indigo focus:border-indigo-700 active:bg-indigo-700 transition duration-150 ease-in-out cursor-pointer")
    else
      link(page, page, class: "px-4 py-2 border border-indigo-600 text-sm leading-5 font-medium rounded-md text-indigo-600 hover:bg-indigo-500 hover:text-white focus:outline-none focus:shadow-outline-indigo focus:border-indigo-700 active:bg-indigo-700 transition duration-150 ease-in-out cursor-pointer")
    end
  end

  def gap
    text = @template.will_paginate_translate(:page_gap) { "&hellip;" }
    %(<span class="text-indigo-600">#{text}</span>)
  end

  def previous_page
    num = @collection.current_page > 1 && @collection.current_page - 1
    previous_or_next_page(num, @options[:previous_label], "px-4 py-2 border border-indigo-600 text-sm leading-5 font-medium rounded-md text-indigo-600 hover:bg-indigo-500 hover:text-white focus:outline-none focus:shadow-outline-indigo focus:border-indigo-700 active:bg-indigo-700 transition duration-150 ease-in-out cursor-pointer")
  end

  def next_page
    num = @collection.current_page < total_pages && @collection.current_page + 1
    previous_or_next_page(num, @options[:next_label], "px-4 py-2 border border-indigo-600 text-sm leading-5 font-medium rounded-md text-indigo-600 hover:bg-indigo-500 hover:text-white focus:outline-none focus:shadow-outline-indigo focus:border-indigo-700 active:bg-indigo-700 transition duration-150 ease-in-out cursor-pointer")
  end

  def previous_or_next_page(page, text, classname)
    if page
      link(text, page, class: classname)
    else
      tag(:span, text, class: "px-4 py-2 bg-gray-300 border border-transparent text-sm leading-5 font-medium rounded-md text-gray-600 focus:outline-none focus:shadow-outline-indigo focus:border-indigo-700 active:bg-indigo-700 transition duration-150 ease-in-out")
    end
  end
end
