module Capybara
  class Session
    def has_link_to?(href)
      has_xpath?("//a[@href='#{href}']")
    end
  end
end
