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
    puts "#{@name} votes for #{vote}"
  end

  def print_score(score)
    puts "#{@name} has #{score} votes"
  end

end