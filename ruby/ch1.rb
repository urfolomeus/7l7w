puts "Hello, world."

puts "Hello, Ruby".index('Ruby')

10.times { puts "Alan Gardner" }

10.times {|n| puts "This is sentence #{n+1}"}

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
      -1 => Proc.new { puts "too low" },
      0  => Proc.new { puts "yay!"; exit },
      1  => Proc.new { puts "too high" }
    }
  end
end

game = RandomGuesser.new
game.play

