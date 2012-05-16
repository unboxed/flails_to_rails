module Capybara
  class Session
    ENTRY_BASE_PATH = "//div[contains(@class,'entry')]"

    def has_entry?(entry = {})
      xpath = ENTRY_BASE_PATH.dup

      if entry.has_key?(:position)
        xpath << "[#{entry[:position]}]"
      end

      xpath << "//a"

      if entry.has_key?(:url)
        xpath << "[@href='#{entry[:url]}']"
      end

      if entry.has_key?(:title)
        xpath << "[text()='#{entry[:title]}']"
      end

      has_xpath?(xpath)
    end

    def has_entries?(count)
      has_xpath?(ENTRY_BASE_PATH, :count => count)
    end
  end
end
