class EntriesController < ApplicationController
  def index
    @user = User.find(current_user)
    @entries = @user.entry
  end

  def new
  end

  def create
    user = User.find(current_user)
    entry = user.entry.create(entry_params)
    redirect_to user_path(current_user)
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
 
    if @entry.update_attributes entry_params
       #redirect_to @article
       #redirect_to articles_path
       flash[:success] = "Update success!"
       #redirect_to entries_url
       redirect_to user_path(current_user)
    else
     render 'edit'
    end

  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
 
    #redirect_to entries_path
    redirect_to user_path(current_user)
  end  
#=========================================================================================================================

  private
  def entry_params
    params.require(:entry).permit(:title, :body)
  end
end
