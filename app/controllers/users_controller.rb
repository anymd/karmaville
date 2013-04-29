class UsersController < ApplicationController
  def index
    
    # User.benchmark('querying user karma points') do
      
      @page = params[:page].to_i || 1
      @users = User.by_karma.limit(50).offset(@page*50)
    # end

  end
end
