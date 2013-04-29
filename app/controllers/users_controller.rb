class UsersController < ApplicationController
  def index
    
    User.benchmark('querying user karma points') do
      @users = User.by_karma.limit(50)
    end

  end
end
