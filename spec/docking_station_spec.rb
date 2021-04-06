require './lib/docking_station'
require './lib/bike'
describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  # as a user I want the station to release a bike
  describe '#release_bike' do
    it 'releases a docked bike' do
      bike1 = Bike.new
      subject.dock(bike1)
      expect(subject.release_bike).to eq(bike1)
    end

    it '#release bike returns working bike' do
      bike1 = Bike.new
      expect(bike1).to be_working #predicate matcher - no "?" needed
     end

    it 'raises error when no bikes available' do
      expect{ subject.release_bike }.to raise_error 'No bikes in station'
    end
  end

  # as a user I want to be able to dock the bike
  describe '#dock' do
    it 'runs #dock on a bike' do
      expect { subject.dock(Bike.new) }.not_to raise_error
    end

    it 'returns docked bikes' do
      bike1 = Bike.new
      subject.dock(bike1)
      expect(subject.bikes[0]).to eq(bike1)
      # subject.bike is the attr_reader variable 'bike' of DockingStation
    end

    it 'disallows a dock if station capacity is full' do
      subject.DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect{ subject.dock(Bike.new) }.to raise_error 'docking station full'
    end

    it 'will store up to DEFAULT_CAPACITY bikes' do
      subject.DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect(subject.bikes.length).to eq(subject.DEFAULT_CAPACITY)
    end

    it 'after (DEFAULT_CAPACITY -5) bikes, will tell us whether station is #full?' do
      n = (subject.DEFAULT_CAPACITY) -5
      n.times { subject.dock(Bike.new) }
      1.times { subject.dock(Bike.new) }
      expect{ subject.dock(Bike.new) }.not_to raise_error
      # expect(subject).not_to be_full #predicate matcher
    end

  end

  describe '#initialize' do

  end
end
