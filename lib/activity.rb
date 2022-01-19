class Activity

  attr_reader :name,
              :participants,
              :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, amount_paid)
    @total_cost += amount_paid
    @participants[name] = amount_paid
  end

  def split
    @total_cost / @participants.count
  end

  def owed #amount each person paid = the difference between paid and split
    owed = {} #placeholder
    @participants.each_pair do |name, amount_paid|
      owed[name] = (split - amount_paid) #owed is the hash, name is the key in the hash
    end #so the key's value will equal the split amount - the paid amount
    owed
  end

end
