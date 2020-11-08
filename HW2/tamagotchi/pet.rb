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
    @fullness > 10 ? @fullness -= rand(5..10) : @fullness = 0
    @activity > 10 ? @activity -= rand(5..10) : @activity = 0
    @happiness.between?(0, 90) ? @happiness += rand(5..10) : @happiness = 100
  end

  def feed
    @fullness.between?(0, 90) ? @fullness += rand(5..10) : @fullness = 100
    @happiness.between?(0, 90) ? @happiness += rand(5..10) : @happiness = 100
  end

  def sleep
    @fullness > 10 ? @fullness -= rand(5..10) : @fullness = 0
    @activity.between?(0, 90) ? @activity += rand(5..10) : @activity = 100
    @happiness.between?(0, 90) ? @happiness += rand(5..10) : @happiness = 100
  end

  def heal
    @health = 100
    @happiness = 100
  end

  def watch
    time_passed
  end

  private

  def happy?
    @happiness > 60
  end

  def wants_to_sleep?
    @activity < 30
  end

  def angry?
    @fullness < 20
  end

  def wants_to_poop?
    @fullness == 100
  end

  def time_passed
    puts 'Some hours later...'
    puts 'Your pet poops on the floor' if wants_to_poop?
    puts 'Pet wants to sleep!' if wants_to_sleep?
    puts 'Is not in a good mood' if @happiness < 30
  end
end
