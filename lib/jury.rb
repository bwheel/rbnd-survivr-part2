class Jury
  attr_accessor :members

  def initialize()
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    # todo: figure out how to get vote from contestant.
    result = Hash.new(finalists.length)
    @members.each do |member|
      #result << member.vote(finalists)

    end
    
    return result

  end
end