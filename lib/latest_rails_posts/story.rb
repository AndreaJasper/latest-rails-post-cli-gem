class LatestRailsPosts::Story
  attr_accessor :headline, :author, :date, :content, :url

  @@latest_stories = []

  def self.latest_stories
    @@latest_stories
  end

  def self.scrape_latest_stories
    doc = Nokogiri::HTML(URI.open("https://dev.to/t/rails/top/week"))

    doc.css(".articles-list .crayons-story__body").each do |article|
      story = self.new
      story.headline = article.css(".crayons-story__title a").text
      story.author = article.css("a.crayons-story__secondary fw-medium").text
      story.date = article.css("a.crayons-story__tertiary fs-xs").text
      story.url = article.css(".crayons-story__title a").attribute("href").value
      story.content = self.scrape_story_content(story.url)

      self.latest_stories << story
    end
  end

  def self.scrape_story_content(url)
    doc = Nokogiri::HTML(URI.open("https://dev.to/" + url))

    content = doc.css("div.crayons-article__body").collect do |paragraph|
      paragraph.text
    end
  end

  def self.find(id)
    self.latest_stories[id.to_i - 1]
  end

end