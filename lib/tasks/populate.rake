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
cheese_hard_unopened = Food.new
    cheese_hard_unopened.name = "Cheese (hard, unopened)"
    cheese_hard_unopened.shelf_life = 90
    cheese_hard_unopened.save!

    cheese_hard_opened = Food.new
    cheese_hard_opened.name = "Cheese (hard, opened)"
    cheese_hard_opened.shelf_life = 35
    cheese_hard_opened.save!

    cheese_shredded_unopened = Food.new
    cheese_shredded_unopened.name = "Cheese (shredded, unopened)"
    cheese_shredded_unopened.shelf_life = 60
    cheese_shredded_unopened.save!

    cheese_shredded_opened = Food.new
    cheese_shredded_opened.name = "Cheese (shredded, opened)"
    cheese_shredded_opened.shelf_life = 28
    cheese_shredded_opened.save!

    cheese_soft_unopened = Food.new
    cheese_soft_unopened.name = "Cheese (soft, unopened)"
    cheese_soft_unopened.shelf_life = 7
    cheese_soft_unopened.save!

    cottage_cheese_unopened = Food.new
    cottage_cheese_unopened.name = "Cottage cheese (unopened)"
    cottage_cheese_unopened.shelf_life = 7
    cottage_cheese_unopened.save!

    cottage_cheese_opened = Food.new
    cottage_cheese_opened.name = "Cottage cheese (opened)"
    cottage_cheese_opened.shelf_life = 5
    cottage_cheese_opened.save!

    cream_cheese_unopened = Food.new
    cream_cheese_unopened.name = "Cream cheese (unopened)"
    cream_cheese_unopened.shelf_life = 21
    cream_cheese_unopened.save!

    cream_cheese_opened = Food.new
    cream_cheese_opened.name = "Cream cheese (opened)"
    cream_cheese_opened.shelf_life = 10
    cream_cheese_opened.save!

    yogurt_unopened = Food.new
    yogurt_unopened.name = "Yogurt (unopened)"
    yogurt_unopened.shelf_life = 14
    yogurt_unopened.save!

    yogurt_opened = Food.new
    yogurt_opened.name = "Yogurt (opened)"
    yogurt_opened.shelf_life = 7
    yogurt_opened.save!

    # grains
    bread_bakery = Food.new
    bread_bakery.name = "Bread (bakery)"
    bread_bakery.shelf_life = 3
    bread_bakery.save!

    bread_packaged = Food.new
    bread_packaged.name = "Bread (packaged)"
    bread_packaged.shelf_life = 7
    bread_packaged.save!

    rice_raw = Food.new
    rice_raw.name = "Rice (raw)"
    rice_raw.shelf_life = 1460
    rice_raw.save!

    rice_cooked = Food.new
    rice_cooked.name = "Rice (cooked)"
    rice_cooked.shelf_life = 5
    rice_cooked.save!

    pizza = Food.new
    pizza.name = "Pizza"
    pizza.shelf_life = 3
    pizza.save!

    # meat
    beef_raw = Food.new
    beef_raw.name = "Beef (raw)"
    beef_raw.shelf_life = 7
    beef_raw.save!

    chicken_raw = Food.new
    chicken_raw.name = "Chicken (raw)"
    chicken_raw.shelf_life = 2
    chicken_raw.save!

    sushi = Food.new
    sushi.name = "Sushi"
    sushi.shelf_life = 1
    sushi.save!

    fish_fresh = Food.new
    fish_fresh.name = "Fish (fresh)"
    fish_fresh.shelf_life = 2
    fish_fresh.save!

    # veggie
    spinach = Food.new
    spinach.name = "Spinach"
    spinach.shelf_life = 7
    spinach.save!

    carrot = Food.new
    carrot.name = "Carrot"
    carrot.shelf_life = 28
    carrot.save!

    vegetables_frozen = Food.new
    vegetables_frozen.name = "Vegetables (frozen)"
    vegetables_frozen.shelf_life = 240
    vegetables_frozen.save!

    # other
    honey = Food.new
    honey.name = "Honey"
    honey.shelf_life = 36500
    honey.save!

    sugar = Food.new
    sugar.name = "Sugar"
    sugar.shelf_life = 36500
    sugar.save!

    salt = Food.new
    salt.name = "Salt"
    salt.shelf_life = 36500
    salt.save!

  end
end
