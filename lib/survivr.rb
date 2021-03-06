require('colorizer')
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  # Step 1: Create 20 contestants, and put into 2 tribes
  # global variables above^^^.

  count = 0
  # Step 2: Tribes compete in 8 immunity challenges.
  8.times do
    # --- Step 2a: There is a losing tribe each time.
    losing_tribe = @borneo.immunity_challenge

    # --- Step 2b: One contestant is eliminated each time.
    losing_tribe.tribal_council({})

    count += 1
  end
  
  return count
end

def phase_two

  count = 0
  # Step 1: Single tribe compete in 3 additional indiviaul immunity challeges
  3.times do
    # --- Step 1a: the indiviaul winner of each challenge is immune from being eliminated
    immune_member = @borneo.individual_immunity_challenge
    
    # --- Step 1b: One contestant is eliminated each challenge
    @merge_tribe.tribal_council ({ :immune=> immune_member})
    count += 1
  end
  return count 
end

def phase_three
  count = 0
  # Step 1: Single tribe compete 7 more immunity challeges
  7.times do
    # Step 1a: a winner is immune after each challenge
    immune_member = @borneo.individual_immunity_challenge
    
    # Step 1b: Eliminated contestant is set aside during challenges to a "jury" group
    jury_memeber = @merge_tribe.tribal_council ({ :immune=> immune_member})
    @jury.add_member jury_memeber

    count += 1
  end
  return count
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
