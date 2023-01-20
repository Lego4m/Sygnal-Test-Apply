namespace :dev do
  desc "Setup"
  task setup: :environment do
    Status.create!(description: 'pending');
    Status.create!(description: 'in_progress');
    Status.create!(description: 'finished');
  end
end
