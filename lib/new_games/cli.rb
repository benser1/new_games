require 'pry' 

class NewGames::CLI 

  def call
    Game.scrape_all
    list 
    menu
  end

  def list 
    puts ""
    puts "************* Xbox One Upcoming Games ****************"
    puts "" 
    Game.all.each.with_index(1) do |game, i| 
      puts "#{i}. #{game.title}"
    end
  end ## list end

  def menu
    input = nil 
    while input != "exit"
      puts "----------------------------------------------"
      puts "Which game would you like to know more about?"
      puts "" 
      puts "Type the number that matches the game"
      puts ""
      puts "Type list to see the list again"
      puts "Type exit to end the program"
      puts "----------------------------------------------"
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i.between?(1, Game.all.size)
        game = Game.find(input)
        puts "   Name: #{game.title}"
        puts "   Date: #{game.date}"
        puts "   Price: #{game.price}"
        puts "   Publisher: #{game.publisher}"
      elsif !input.to_i.between?(1, Game.all.size)
          puts "Invalid number. Please type a valid number"
      else
        "goodbye"
      end
    end
    puts "Come back to see a list of upcoming Xbox One games"
  end


end ## class end