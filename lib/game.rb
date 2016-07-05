class Game
  attr_reader :tribes
  def initialize(*tribes)
    @tribes = ([] << tribes).flatten!
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  # this method returns the losing tribe? TODO: check that it's the losers or winners
  def immunity_challenge
    return @tribes.sample
  end

  def clear_tribes
    @tribes.clear
  end

  def merge(tribe_name)
    
    # combine the remaining members into one list
    members = (@tribes.first.members << @tribes.last.members).flatten!
    
    # remove the old tribes.
    clear_tribes

    # create and add new tribe with the remaining members list
    add_tribe Tribe.new({name:tribe_name, members: members})

    # return the remaining tribe.
    @tribes.first
    
  end

  def individual_immunity_challenge
    tribe = @tribes.first
    imunity_index = rand(tribe.members.length)
    return tribe.members[imunity_index]
  end
end
