namespace :db do
  desc "Loads db/custom_seeds.rb"
  task custom_seed: :environment do
    load(Rails.root.join("db", "custom_seeds.rb"))
  end
end
