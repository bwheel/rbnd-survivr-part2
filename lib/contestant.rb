
require('colorizer')
class Contestant

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end

  def cast_vote(finalist)
    
    vote = finalist.sample

    print_vote vote
    
    return vote
  end

  def print_vote(vote)
    name = "#{@name}".yellow
    my_vote = "#{vote}".blue

    puts "#{name} votes for #{my_vote}"
  end

  def print_score(score)
    name = "#{@name}".yellow
    my_score = "#{score}".blue
    puts "#{name} has #{my_score} votes"
  end

  def print
    puts "#{@name}.yellow"
  end

end