class LatestRailsPosts::CLI

  def call
    greeting
    LatestRailsPosts::Story.scrape_latest_stories
    list
    menu
  end

  def greeting
    puts "Welcome to ScienceMag Latest News!"
    puts "Fetching stories..."
    puts ""
  end

  def list
    @stories = LatestRailsPosts::Story.latest_stories
    @stories.each.with_index(1) do |story, i|
      puts "#{i}. #{story.headline}"
    end

    puts ""
  end

  def menu
    input = nil

    while input != "exit"
      puts "Type the number of the post you'd like to read. You can also type 'list' to see the stories again or 'exit'."
      input = gets.chomp

      if input.to_i.between?(1, LatestRailsPosts::Story.latest_stories.size)
        story = LatestRailsPosts::Story.find(input)
        puts ""
        story.headline.size.times {print "-"}
        puts ""
        puts "#{story.headline}"
        puts "#{story.author} | #{story.date}"
        puts ""
        puts "#{story.content.join("\n\n")}"
        story.headline.size.times {print "-"}
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