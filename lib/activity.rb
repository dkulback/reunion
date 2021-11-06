class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, paid)
    @participants[name] = paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.keys.count
  end

  def owed
    @participants.each_with_object({}) do |participant, accumulator|
      accumulator[participant[0]] = (split - participant[1])
    end
  end
end
