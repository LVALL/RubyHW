require 'html_maker'

class Pet
  attr_accessor :kind, :name, :health, :happiness, :fullness, :activity

  def initialize(health = 100, happiness = 100, fullness = 100, activity = 100, kind = 'cat', name = 'default')
    @health = health
    @happiness = happiness
    @fullness = fullness
    @activity = activity
    @kind = kind
    @name = name
  end

  def play
    puts "#{@name} scrath your sofa, meow, meow" if @kind == 'cat'
    puts 'woof woof' if @kind == 'dog'
    puts 'Funny!) that`s so funny'
    @happiness.between?(0, 90) ? @happiness += rand(5..10) : @happiness = 100
    decrease_stat
  end

  def feed
    puts 'OmNomNom, so tasty'
    @fullness.between?(0, 90) ? @fullness += rand(5..10) : @fullness = 100
    increase_stat
  end

  def sleep
    puts "SnoooZe 💤💤💤💤💤\n#{@name} wakes up and yawned"
    @fullness > 10 ? @fullness -= rand(5..10) : @fullness = 0
    increase_stat
    time_passed
  end

  def heal
    @health = 100
    @happiness = 100
    puts "#{@name} happy and healthy again, so you can play with it"
    time_passed
  end

  def watch
    time_passed
  end

  def create_html
    html
  end

  private

  def hungry?
    @fullness < 30
  end

  def happy?
    @happiness > 60
  end

  def wants_to_sleep?
    @activity < 30
  end

  def angry?
    @fullness < 30 && @happiness < 40
  end

  def wants_to_poop?
    @fullness == 100
  end

  def decrease_stat
    @fullness > 20 ? @fullness -= rand(10..20) : @fullness = 0
    @activity > 20 ? @activity -= rand(10..20) : @activity = 0
  end

  def increase_stat
    @activity.between?(0, 90) ? @activity += rand(5..10) : @activity = 100
    @happiness.between?(0, 90) ? @happiness += rand(5..10) : @happiness = 100
  end

  def time_passed
    positive_emotions = ['Pet wants to kiss you, let it do', 'He is so happy', 'Starts dancing and funny jumped']
    negative_emotions = ['Angry RoArrr!!!', 'Frrrmrrhrmr', 'Your pet bites you', '*Quiet howl*, that`s not good']
    puts 'Your pet poops on the floor' if wants_to_poop?
    puts 'Pet wants to sleep!' if wants_to_sleep?
    puts positive_emotions.sample if happy?
    puts negative_emotions.sample if angry?
  end

  def html
    content = "<p>Health: #{@health}</p>
      <p>Happiness: #{@happiness}</p>
      <p>Fullness: #{@fullness}</p>
      <p>Activity: #{@activity}</p>"

    MakeHtml.new.make_html(content, true)
  end
end
