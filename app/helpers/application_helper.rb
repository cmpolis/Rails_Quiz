# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title page_title
    content_for(:title) { page_title }
  end

  # simple admin check for now...
  def user_is_admin?
    !current_user.nil? and current_user.id == 1
  end

end
