class Tribe
  attr_reader :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts "---------------------".grey
    puts "The " << "#{@name}".pink << " tribe was created with the following members"
    @members.each do |member|
      member.print
    end
    puts "---------------------".grey
  end

  def to_s
    @name
  end

  # Phase 1: One of the contestants is removed from losing tribe(this object).
  def tribal_council(immune_hash)
    
    
    byebye_member = ""

    if not immune_hash.key? :immune
      # phase 1
      remove_index = rand(@members.length)
      byebye_member = @members.delete_at(remove_index)
    
    else
      
      # phase 3
      immune = immune_hash[:immune]
      
      # remove the immune from members
      @members.delete(immune)
      
      # remove the random person
      remove_index = rand(@members.length)
      byebye_member = @members.delete_at(remove_index)
      
      # put back immune into the members
      @members << immune
    end

    return byebye_member
  end

end