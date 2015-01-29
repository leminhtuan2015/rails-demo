class HomeController < ApplicationController
  def index
    if(current_user != nil)
      @users = current_user.following
        @feeds = Array.new()
        i = 0
        @users.each do |user|
          @entries = user.entry.order('updated_at DESC').limit(3)
            @entries.each do |e|
              @feeds[i] = e
              i = i+1
            end
        end
    end
  end
end
