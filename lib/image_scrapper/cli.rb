require 'thor'

module ImageScrapper
  # Command Line Interface for the Scraper library.
  class CLI < Thor
    desc 'images URL', 'Outputs image URLs from web page'
    def images(url)
      puts Scraper.new(url).images
    end
  end
end
