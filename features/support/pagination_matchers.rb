module Capybara
  class Session
    def has_pages?(count)
      has_css?("li.page", :count => count)
    end

    def on_page?(page_num)
      current_page = find('.page.active').text.to_i
      current_page.should == page_num
    end
  end
end
