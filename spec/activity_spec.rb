require './lib/activity'

RSpec.describe Activity do
  let(:activity) { activity = Activity.new('Brunch') }
  it 'exists' do
    actual = activity
    expected = Activity
    expect(actual).to be_a(expected)
  end
  describe '#attributes' do
    it 'has a name' do
      actual = activity.name
      expected = 'Brunch'
      expect(actual).to eq(expected)
    end
    it 'has participants{}' do
      actual = activity.participants
      expected = {}
      expect(actual).to eq(expected)
    end
  end
  describe '#add_participant/2' do
    it 'adds a participant' do
      activity.add_participant('Maria', 20)
      activity.add_participant('Luther', 40)
      actual = activity.participants
      expected = { 'Maria' => 20, 'Luther' => 40 }
      expect(actual).to eq(expected)
    end
  end
  describe '#total_cost' do
    it 'shows you the expenses of the activites combined' do
      activity.add_participant('Maria', 20)
      activity.add_participant('Luther', 40)
      actual = activity.total_cost
      expected = 60
      expect(actual).to eq(expected)
    end
  end
  describe '#split' do
    it 'splits the total cost between participants' do
      activity.add_participant('Maria', 20)
      activity.add_participant('Luther', 40)
      actual = activity.split
      expected = 30
      expect(actual).to eq(expected)
    end
  end
  describe '#owed' do
    it 'shows how much a partipant owes or is owed{}' do
      activity.add_participant('Maria', 20)
      activity.add_participant('Luther', 40)
      actual = activity.owed
      expected = { 'Maria' => 10, 'Luther' => -10 }
      expect(actual).to eq(expected)
    end
  end
end
