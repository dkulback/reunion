class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    reunion_cost = 0
    activities.map { |activity| reunion_cost += activity.total_cost }
    reunion_cost
  end

  def breakout
    totals = {}
    @activities.each do |activity|
      totals.merge!(activity.owed) { |_k, oldv, newv| oldv + newv }
    end
    totals
  end

  def summary
   summary_string = ""
   breakout.each_pair do |k, v|
     summary_string += "#{k}: #{v}\n"
   end
   summary_string.chomp
 end
end
