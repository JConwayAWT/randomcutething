namespace :cutes do
  desc "Update the cutes"
  task update: :environment do
    puts "Updating cutes..."
    Cute.update_cutes
    puts "Finished."
  end

end
