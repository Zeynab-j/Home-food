module ApplicationHelper
  def signned_user
    s_user = session[:current_user]
    user = User.find(s_user['id']) rescue nil
  end
end
