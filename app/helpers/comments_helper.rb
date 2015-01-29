module CommentsHelper
  def get_commentor(user_id)
    return User.find(user_id);
  end
end
