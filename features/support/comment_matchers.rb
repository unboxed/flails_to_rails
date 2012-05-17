module Capybara
  class Session
    COMMENT_BASE_PATH = "//div[contains(@class,'comment')]"

    def has_comment?(body)
      xpath = COMMENT_BASE_PATH.dup
      xpath << "//p[contains(.,'#{body}')]"
      has_xpath?(xpath)
    end

    def has_comments?(count)
      has_xpath?(COMMENT_BASE_PATH, :count => count)
    end
  end
end
