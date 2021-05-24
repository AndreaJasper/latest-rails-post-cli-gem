class LatestRailsPosts::Post
  attr_accessor :headline, :author, :date, :content, :url

  @@latest_posts = []

  def self.latest_posts
    @@latest_posts
  end

  def self.scrape_latest_posts
    doc = Nokogiri::HTML(URI.open("https://dev.to/t/rails/top/week"))

    doc.css(".articles-list .crayons-story__body").each do |article|
      post = self.new
      post.headline = article.css(".crayons-story__title a").text
      post.author = article.css("a.crayons-story__secondary").text
      post.date = article.css("a.crayons-story__tertiary").text
      post.url = article.css(".crayons-story__title a").attribute("href").value
      post.content = self.scrape_post_content(post.url)

      self.latest_posts << post
    end
  end

  def self.scrape_post_content(url)
    doc = Nokogiri::HTML(URI.open("https://dev.to/" + url))

    content = doc.css("div.crayons-article__body").collect do |paragraph|
      paragraph.text
    end
  end

  def self.find(id)
    self.latest_posts[id.to_i - 1]
  end

end