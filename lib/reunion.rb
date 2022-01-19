class Reunion
  attr_reader :name,
              :activities,
              :total_cost

  def initialize(name)
    @name = name
    @activities = []
    @total_cost = 0
  end

  def add_activity(activity)
    @activities << activity
    @total_cost += activity.total_cost
  end

  def breakout #key = person's name, value = what's owed for everything
    breakout = {}
    @activities.each do |activity|
      activity.owed.each_pair do |name, amount_owed|
        if breakout.has_key?(name)
          breakout[name] += amount_owed
        elsif !breakout.has_key?(name)
          breakout[name] = amount_owed
        end
      end
    end
    breakout
  end

  def summary
    summary = ""
    participants = breakout.keys #breakout is a hash, inside the array participants
    counter = 0
    until breakout.keys.count == counter #until number of keys(names) in breakout = 3...keep going
      summary += "#{participants[0]}: #{breakout[participants[0]]}\n"
      counter += 1
      participants.shift
      require "pry"; binding.pry
    end
    summary.chomp
  end

end
