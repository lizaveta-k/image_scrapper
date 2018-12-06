require 'spec_helper'

describe ImageScrapper::CLI do
  it 'output links' do
    links = %w(a b)
    allow_any_instance_of(ImageScrapper::Scraper).to receive(:images) { links }
    allow(STDOUT).to receive(:puts).with(links)

    described_class.new.images('http://a.b/')
  end
end
