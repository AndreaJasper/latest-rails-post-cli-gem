class LatestRailsPosts::CLI

  def call
    greeting
    LatestRailsPosts::Post.scrape_latest_posts
    list
    menu
  end

  def greeting
    puts "Welcome to the latest Rails News from Dev.to".colorize(:blue)
    puts "Fetching stories...".colorize(:green)
    puts ""
  end

  def list
    @posts = LatestRailsPosts::Post.latest_posts
    @posts.each.with_index(1) do |post, i|
      puts "#{i}. #{post.headline.colorize(:light_blue)} | #{post.date}"
    end

    puts ""
  end

  def menu
    input = nil

    while input != "exit"
      puts "Type the number of the post you'd like to read. You can also type 'list' to see the stories again or 'exit'.".colorize(:green)
      input = gets.strip

      if input.to_i.between?(1, LatestRailsPosts::Post.latest_posts.size)
        post = LatestRailsPosts::Post.find(input)
        puts ""
        post.headline.size.times {print "-"}
        puts ""
        puts "#{post.headline}".colorize(:light_blue)
        puts "#{post.author} | #{post.date}".colorize(:green)
        puts ""
        puts "#{post.content.join("\n\n")}"
        post.headline.size.times {print "-"}
        puts ""
      elsif input == "list"
        list
      elsif input == "exit"
        puts "Thank you for learning more about Rails. Happy reading!".colorize(:yellow)
        exit
      else
        puts "Invalid input. Please try again."
      end
    end
  end

end