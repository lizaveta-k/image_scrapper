require 'httparty'
require 'nokogiri'

module ImageScrapper
  # Scraps all images from the web page.
  class Scraper
    def initialize(url)
      @url = url
    end

    def images
      doc.xpath('//img/@src').each_with_object([]) do |src, images|
        next if (link = src.value).empty?

        normalized = normalize_link(link)

        next if images.include?(normalized)

        images << normalized
      end
    end

    private

    def normalize_link(link)
      URI.join(@url, link).to_s
    end

    def doc
      return @doc if @doc

      html = HTTParty.get(@url)
      @doc = Nokogiri::HTML(html)
    end
  end
end
