module Capybara
  class Session
    def has_entry?(entry = {})
      xpath = "//div[@class='entry']"

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
  end
end
