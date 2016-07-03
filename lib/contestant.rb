
class Contestant

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end

  def cast_vote(finalist)
    #TODO: Make this a randome selection.
    vote = finalist[rand(finalist.length)]

    print_vote vote
    
    return vote
  end

  def print_vote(vote)
    name = "#{@name}".yellow
    my_vote = "#{score}".blue

    puts "#{name} votes for #{my_vote}"
  end

  def print_score(score)
    name = "#{@name}".yellow
    my_score = "#{score}".blue
    puts "#{name} has #{my_score} votes"
  end

  def print
    puts @name
  end

end