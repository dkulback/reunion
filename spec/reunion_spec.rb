require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do
  let(:reunion) { Reunion.new('1406 BE') }
  it 'exists' do
    actual = reunion
    expected = Reunion
    expect(actual).to be_a(expected)
  end
  describe '#attributes' do
    it 'has a name' do
      actual = reunion.name
      expected = '1406 BE'
      expect(actual).to eq(expected)
    end
    it 'has a activites' do
      actual = reunion.activities
      expected = []
      expect(actual).to eq(expected)
    end
  end
  describe '#add_activity/1' do
    it 'adds activites to reunion' do
      activity_1 = Activity.new('Brunch')
      reunion.add_activity(activity_1)
      actual = reunion.activities
      expected = [activity_1]
      expect(actual).to eq(expected)
    end
  end
  describe '#total_cost' do
    it 'adds activites to reunion' do
      activity_1 = Activity.new('Brunch')
      activity_1.add_participant('Maria', 20)
      activity_1.add_participant('Luther', 40)
      reunion.add_activity(activity_1)
      actual = reunion.total_cost
      expected = 60
      expect(actual).to eq(expected)
      activity_2 = Activity.new('Drinks')
      activity_2.add_participant('Maria', 60)
      activity_2.add_participant('Luther', 60)
      activity_2.add_participant('Louis', 0)
      reunion.add_activity(activity_2)
      actual = reunion.total_cost
      expected = 180
      expect(actual).to eq(expected)
    end
  end

  describe '#breakout/1' do
    it 'adds activites to reunion' do
      activity_1 = Activity.new('Brunch')
      activity_1.add_participant('Maria', 20)
      activity_1.add_participant('Luther', 40)
      reunion.add_activity(activity_1)
      activity_2 = Activity.new('Drinks')
      activity_2.add_participant('Maria', 60)
      activity_2.add_participant('Luther', 60)
      activity_2.add_participant('Louis', 0)
      reunion.add_activity(activity_2)

      actual = reunion.breakout
      expected = { 'Maria' => -10, 'Luther' => -30, 'Louis' => 40 }
      expect(actual).to eq(expected)
    end
  end
  describe '#summary' do
    it 'adds activites to reunion' do
      activity_1 = Activity.new('Brunch')
      activity_1.add_participant('Maria', 20)
      activity_1.add_participant('Luther', 40)
      reunion.add_activity(activity_1)
      activity_2 = Activity.new('Drinks')
      activity_2.add_participant('Maria', 60)
      activity_2.add_participant('Luther', 60)
      activity_2.add_participant('Louis', 0)
      reunion.add_activity(activity_2)

      actual = reunion.summary
      expected = "Maria: -10\nLuther: -30\nLouis: 40"
      expect(actual).to eq(expected)
    end
  end
end
