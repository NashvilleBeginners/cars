namespace :db do
  desc 'Populates the DB'
  task :populate => :environment do
    %w(
      Car
      Color
      Make
      Model
    ).map do |model|
      model.constantize.destroy_all
    end

    color = Color.create! name: 'Green'
    model  = Model.create! name: 'Galant'

    Car.create! color_id: color.id,
      model_id: model.id,
      number_of_seats: 4,
      number_of_doors: 4,
      year: 2001

    puts 'Car created'
  end
end
