module Capybara
  class Session
    def has_image?(image)
      # Use contains rather than equals to ignore any ?size=x parameters
      has_xpath?("//img[contains(@src,'#{image}')]")
    end
  end
end
