module Capybara
  class Session
    def has_pages?(count)
      has_xpath?("//li[contains(@class,'page')]", :count => count)
    end
  end
end
