require_relative 'pet'

class Game
  def create_pet
    @pet = Pet.new
    puts 'What animal you want to have ?)'
    @pet.kind = gets.chomp.to_s
    puts "Your #{@pet.kind} was born"
    print 'Choose name for it: '
    @pet.name = gets.chomp.to_s
    puts "#{@pet.name.capitalize} likes this name! \nYour pet loves you 💚"
    @pet.create_html
  end

  def start_game
    create_pet
    help
    @pet.open_tab

    while @health != 0
      print "\nChoose command (to show info press `7`, than `Enter`): "
      decision = gets.chomp
      break if decision == '6'

      case decision
      when '1'
        @pet.play
        @pet.create_html
      when '2'
        @pet.feed
        @pet.create_html
      when '3'
        @pet.sleep
        @pet.create_html
      when '4'
        @pet.heal
        @pet.create_html
      when '5'
        show_stat
        @pet.create_html
      when '6'
        break
      when '7'
        help
      when ''
        @pet.watch
        @pet.create_html
      else
        puts 'Wrong action'
      end
    end
    puts "#{@pet.name.capitalize} was died 💔" if @health == 0
    puts "#{@pet.name.capitalize} says bye-bye" unless @health == 0
  end

  def help
    puts "\nWhat would you like to do with #{@pet.name.capitalize}:
      1 - Play 🏀
      2 - Feed 🍪
      3 - Take it sleep 💤
      4 - Visit a doctor 🚑
      5 - Show pet's stat
      6 - Exit game
      Press `Enter` to do nothing"
  end

  def show_stat
    puts "\nSomething you need to know about #{@pet.name.capitalize}:
      health - #{@pet.health}
      happiness - #{@pet.happiness}
      fullness - #{@pet.fullness}
      activity - #{@pet.activity}"
  end
end

Game.new.start_game
