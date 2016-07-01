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
    @tribes[0]
  end
end
