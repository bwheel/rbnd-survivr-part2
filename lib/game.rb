class Game
  attr_reader :tribes
  def initialize(first_tribe, second_tribe)
    @tribes = [first_tribe, second_tribe]
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  # this method returns the losing tribe? TODO: check that it's the losers or winners
  def immunity_challenge
    imunity_index = rand(@tribes.length)
    return @tribes[imunity_index]
  end

  def clear_tribes
    @tribes.clear
  end

  def merge(tribe_name)
    members = (@tribes.first.members << @tribes.last.members).flatten!
    return Tribe.new({name:tribe_name, members: members})
    
  end

  def individual_immunity_challenge
    tribe = @tribes.first
    imunity_index = rand(tribe.members.length)
    return tribe.members[imunity_index]
  end
end
