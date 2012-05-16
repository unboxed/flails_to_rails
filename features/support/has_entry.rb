module Capybara
  class Session
    def has_entry?(entry, options = {})
      xpath = "//div[@class='entry']"
      if options.has_key?(:position)
        xpath << "[#{options[:position]}]"
      end
      xpath << "//a[@href='#{entry.url}'][text()='#{entry.title}']"

      has_xpath?(xpath)
    end
  end
end
