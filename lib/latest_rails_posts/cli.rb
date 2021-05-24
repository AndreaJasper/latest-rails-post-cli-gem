class LatestRailsPosts::CLI

  def call
    greeting
    LatestRailsPosts::Post.scrape_latest_posts
    list
    menu
  end

  def greeting
    puts "Welcome to the latest Rails News from Dev.to"
    puts "Fetching stories..."
    puts ""
  end

  def list
    @posts = LatestRailsPosts::Post.latest_posts
    @posts.each.with_index(1) do |post, i|
      puts "#{i}. #{post.headline}"
    end

    puts ""
  end

  def menu
    input = nil

    while input != "exit"
      puts "Type the number of the post you'd like to read. You can also type 'list' to see the stories again or 'exit'."
      input = gets.chomp

      if input.to_i.between?(1, LatestRailsPosts::Post.latest_posts.size)
        post = LatestRailsPosts::Post.find(input)
        puts ""
        post.headline.size.times {print "-"}
        puts ""
        puts "#{post.headline}"
        puts "#{post.author} | #{post.date}"
        puts ""
        puts "#{post.content.join("\n\n")}"
        post.headline.size.times {print "-"}
        puts ""
      elsif input == "list"
        list
      elsif input == "exit"
        exit
      else
        puts "Invalid input. Please try again."
      end
    end
  end

end