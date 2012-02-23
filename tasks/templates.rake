namespace :templates do
  desc "Creates the question template"
  task :questions => :environment do
    puts generate_template(Survey.new, :questions)
  end
end
