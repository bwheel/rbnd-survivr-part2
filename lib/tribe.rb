class Tribe
  attr_reader :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts "---------------------".light_grey
    puts "The " << "#{@name}".pink << " tribe was created with the following members"
    @members.each do |member|
      member.print
    end
    puts "---------------------".light_grey
  end

  def to_s
    @name
  end

  # Phase 1: One of the contestants is removed from losing tribe(this object).
  def tribal_council(options)
    # filter out the immune memeber and grab a random sample member
    rejected = @members.reject { |member| member == options[:immune]  }.sample
    
    # remove the random sample member
    @members.delete(rejected)

    # return the random sample member.
    rejected
  end

end