require 'bike'

# as a user I want to check the bike works
describe Bike do
  it {is_expected.to respond_to(:working?)}
end
