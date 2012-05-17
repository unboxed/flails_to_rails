module Capybara
  class Session
    def has_image?(image)
      has_xpath?("//img[@src='#{image}']")
    end
  end
end
