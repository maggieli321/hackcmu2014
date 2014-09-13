namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
    require 'faker'
    require 'factory_girl_rails'

# fruits
    apple = Food.new
    apple.name = "Apple"
    apple.shelf_life = 14
    apple.save!

    banana = Food.new
    banana.name = "Banana"
    banana.shelf_life = 7
    banana.save!

    strawberry = Food.new
    strawberry.name = "Strawberry"
    strawberry.shelf_life = 5
    strawberry.save!

    grape = Food.new
    grape.name = "Grape"
    grape.shelf_life = 5
    grape.save!

    # dairy
    butter = Food.new
    butter.name = "Butter"
    butter.shelf_life = 30
    butter.save!

    egg = Food.new
    egg.name = "Egg"
    egg.shelf_life = 21
    egg.save!

    milk = Food.new
    milk.name = "Milk"
    milk.shelf_life = 5
    milk.save!

    # grains
    bakery_bread = Food.new
    bakery_bread.name = "Bakery Bread"
    bakery_bread.shelf_life = 3
    bakery_bread.save!

    # meat
    raw_beef = Food.new
    raw_beef.name = "Raw Beef"
    raw_beef.shelf_life = 7
    raw_beef.save!

    raw_chicken = Food.new
    raw_chicken.name = "Raw Chicken"
    raw_chicken.shelf_life = 2
    raw_chicken.save!

    # veggie
    spinach = Food.new
    spinach.name = "Spinach"
    spinach.shelf_life = 7
    spinach.save!

    carrot = Food.new
    carrot.name = "Carrot"
    carrot.shelf_life = 28
    carrot.save!

  end
end
