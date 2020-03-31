# Market Street Apartments

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below using TDD.
* Commit your tests BEFORE you commit your implementations to ensure TDD
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

## Iteration 1

Use TDD to create a Renter class and an Apartment class that respond to the following interaction pattern:

```ruby
 require './lib/renter'

 require './lib/apartment'
# => true

 renter1 = Renter.new("Jessie")
# => #<Renter:0x00007a15c93af80...>

 renter1.name
# => "Jessie"

 unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x00007fb3ecaae7c0...>

 unit1.number
# => "A1"

 unit1.monthly_rent
# => 1200

 unit1.bathrooms
# => 1

 unit1.bedrooms
# => 1

 unit1.renter
# => nil

 unit1.add_renter(renter1)

 unit1.renter
# => #<Renter:0x00007fb3ee106ce8...>
```

## Iteration 2

Use TDD to create a Building class that responds to the following interaction pattern.

```ruby


 building = Building.new
# => #<Building:0x00007f83778c5a80...>

 building.units
# => []

 unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x00007f8377209bb0...>

 unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
# => #<Apartment:0x00007f83779f0900...>

 building.add_unit(unit1)

 building.add_unit(unit2)

 building.units
# => [#<Apartment:0x00007f8377209bb0...>, #<Apartment:0x00007f83779f0900...>]

 building.renters
# => []

 renter1 = Renter.new("Aurora")
# => #<Renter:0x00007fa83bc37978...>

 unit1.add_renter(renter1)

 building.renters
# => ["Aurora"]

 renter2 = Renter.new("Tim")
# => #<Renter:0x00007fa83b9b0358...>

 unit2.add_renter(renter2)

 building.renters
# => ["Aurora", "Tim"]

 building.average_rent
# => 1099.5
```

## Iteration 3

Use TDD to update your Building class so that it responds to the following interaction pattern. Note that the `renter_with_highest_rent` method should ignore units with no renter.

```ruby
 require './lib/building'
# => true

 require './lib/renter'
# => true

 require './lib/apartment'
# => true

 building = Building.new
# => #<Building:0x00007fa83bb74928...>

 unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x00007fa83baae8b8...>

 unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
# => #<Apartment:0x00007fa83bc777d0...>

 unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
# => #<Apartment:0x00007fa83bc777d0...>

 unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
# => #<Apartment:0x00007fa83bc777d0...>

 renter1 = Renter.new("Spencer")
# => #<Renter:0x00007fa83bc37978...>

 building.add_unit(unit1)

 building.add_unit(unit2)

 building.add_unit(unit3)

 building.rented_units
# => []

 unit2.add_renter(renter1)

 building.rented_units
# => [#<Apartment:0x00007fa83bc777d0...>]

 building.renter_with_highest_rent
# => #<Renter:0x00007fa83bc37978...>

 renter2 = Renter.new("Jessie")
# => #<Renter:0x00007fa83b9b0358...>

 unit1.add_renter(renter2)

 building.renter_with_highest_rent
# => #<Renter:0x00007fa83b9b0358...>

 renter3 = Renter.new("Max")
# => #<Renter:0x00007fa83b7t0456...>

 unit3.add_renter(renter3)

 building.renter_with_highest_rent
# => #<Renter:0x00007fa83b9b0358...>

 building.add_unit(unit4)

 building.units_by_number_of_bedrooms
# =>
# {
#   3 => ["D4" ],
#   2 => ["B2", "C3"],
#   1 => ["A1"]
# }
```

## Iteration 4

Use TDD to add an `annual_breakdown` method to your Building class. This method should associate a renter name with the amount they pay in rent for the whole year. Note that the `annual_breakdown` method should ignore units with no renter. Your Building class should now respond to the following interaction pattern:

```ruby
 require './lib/building'
# => true

 require './lib/apartment'
# => true

 require './lib/renter'
# => true

 building = Building.new
# => #<Building:0x00007fb333c0cec8...>

 unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x00007fb333bcd840...>

 unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
# => #<Apartment:0x00007fb333a55008...>

 unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
# => #<Apartment:0x00007fa83bc777d0...>

 renter1 = Renter.new("Spencer")
# => #<Renter:0x00007fb333d0d7f0...>

 building.add_unit(unit1)

 building.add_unit(unit2)

 building.add_unit(unit3)

 unit2.add_renter(renter1)

 building.annual_breakdown
# => {"Spencer" => 11988}

 renter2 = Renter.new("Jessie")
# => #<Renter:0x00007fb333af5a80...>

 unit1.add_renter(renter2)

 building.annual_breakdown
# => {"Jessie" => 14400, "Spencer" => 11988}

 building.rooms_by_renter
#=> {<Renter:0x00007fb333af5a80...> => {bathrooms: 1, bedrooms: 1},
#    #<Renter:0x00007fb333d0d7f0...> => {bathrooms: 2, bedrooms: 2}}

```
