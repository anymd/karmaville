namespace :karma do
desc "Sum user karma"

  task :sum_karma => :environment do

    User.transaction do

      User.all.each do |user|
        user.update_attribute(:karma_sum, user.karma_points.sum(:value))
      end
    end    
  end
end

