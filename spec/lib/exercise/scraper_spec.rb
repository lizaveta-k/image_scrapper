require 'spec_helper'

describe ImageScrapper::Scraper do
  it 'normalizes links' do
    allow(HTTParty).to receive(:get) do
      File.read('spec/fixtures/normalize.html')
    end

    links = described_class.new('http://a.b/c/d').images
    expected = [
      'http://a.b/c/1.jpg',
      'http://a.b/2.jpg',
      'http://b.c/3.jpg'
    ]

    expect(links).to eql(expected)
  end

  it 'ignores empty img tags' do
    allow(HTTParty).to receive(:get) do
      File.read('spec/fixtures/empty.html')
    end

    links = described_class.new('http://a.b/c/d').images

    expect(links).to eql(['http://a.b/1.jpg'])
  end

  it 'ignores duplicate images' do
    allow(HTTParty).to receive(:get) do
      File.read('spec/fixtures/duplicates.html')
    end

    links = described_class.new('http://a.b/c/d').images

    expect(links).to eql(['http://a.b/1.jpg'])
  end
end
