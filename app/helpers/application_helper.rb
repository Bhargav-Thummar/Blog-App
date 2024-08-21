module ApplicationHelper
  def verify_user(comment: nil)
    comment&.user.id == Current.user.id
  end
end
