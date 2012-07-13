puts "Hello, world.\n"

puts "Hello, Ruby".index('Ruby')
puts ""

10.times { puts "Alan Gardner" }
puts ""

10.times {|n| puts "This is sentence #{n+1}"}
puts ""

class RandomGuesser
  def initialize(ceiling=10)
    @num = rand(ceiling) + 1
  end

  def play
    while true
      guess = gets.chomp
      exit if guess == 'exit'
      if guess == 'show'
        puts @num
        next
      end
      calculate_result(guess)
    end
  end

  private

  def calculate_result(guess)
    result = guess.to_i <=> @num
    results_lookup[result].call
  end

  def results_lookup
    {
      -1=>->{puts"too low"},
      0=>->{puts"yay!";exit},
      1=>->{puts"too high"}
    }
  end
end

puts "Random Guesser"
game = RandomGuesser.new
game.play

