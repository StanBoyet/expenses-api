require 'ffaker'

class Populator
  def self.perform
    new.perform
  end

  def perform
    Rails.logger.info 'Generating users, category & expenses...'

    category_ids = []

    5.times do
      category_ids << Category.create(name: FFaker::Lorem.word).id
    end

    5.times do
      user = User.create(username: FFaker::Name.first_name)
      10.times { user.expenses.create(amount: rand(5..30), note: FFaker::Lorem.sentence(2), category_id: category_ids.sample) }
    end

  end

end

namespace :demo do
  task setup_logger: :environment do
    logger = Logger.new(STDOUT)
    logger.level = Logger::INFO
    Rails.logger = logger
  end


  desc 'generate backoffice data'
  task populate: [:setup_logger] do |t, args|
    Populator.perform
  end

end
