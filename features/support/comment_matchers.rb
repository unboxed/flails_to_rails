module Capybara
  class Session
    COMMENT_BASE_PATH = "//div[contains(@class,'comment')]"

    def has_comment?(comment = {})
      xpath = COMMENT_BASE_PATH.dup

      if comment.has_key?(:position)
        xpath << "[#{comment[:position]}]"
      end

      if comment.has_key?(:body)
        xpath << "//p[contains(.,'#{comment[:body]}')]"
      end

      has_xpath?(xpath)
    end

    def has_comments?(count)
      has_xpath?(COMMENT_BASE_PATH, :count => count)
    end
  end
end
