class Jury
  attr_accessor :members

  def initialize()
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    
    # create a Hash variable to return the result.
    result = Hash.new(0)

    # foreach Jury Member, they should cast a vote.
    @members.each do |member|
      
      # Append the result of the vote to the finalist.
      result[member.cast_vote(finalists)] += 1
    end
    
    return result
  end

  def report_votes(final_votes)
    
    final_votes.each do |finalist, score|
      finalist.print_score score
    end
  end

  def announce_winner(final_votes)
    
    # start with a default winner to compare with later.
    finalist_with_most_votes = final_votes.keys[0]    

    # foreach finalist, look for the largest
    final_votes.each do |finalist, votes|
      finalist_with_most_votes = finalist if final_votes[finalist_with_most_votes] < votes
    end
    
    #return the winner
    puts "#{finalist_with_most_votes} won!"
    
    return finalist_with_most_votes
    
  end

end