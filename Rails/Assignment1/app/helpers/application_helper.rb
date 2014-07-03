module ApplicationHelper
  def nav_link_to(click_text, action, url, style )
    if action name == action
      return link_to click_text, url, :class => style
    else
      return link_to click_text, url
    end
  end

  def is_admin?
    return current_user.try( :admin? )
  end

  def stars( num_stars)
     return ((image_tag 'star.png') * num_stars).html_safe
  end
end
