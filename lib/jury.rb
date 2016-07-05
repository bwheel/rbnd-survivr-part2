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
    result = {}
    finalists.each{ |member| result[member] = 0 }

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

    # foreach finalist, look for the largest
    finalist_with_most_votes = final_votes.max_by{ |finalist, votes| votes }.first
    
    #return the winner
    puts "#{finalist_with_most_votes}".yellow << " won!"
    
    return finalist_with_most_votes
    
  end

end