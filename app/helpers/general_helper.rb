module GeneralHelper

  def about_nav_active?(link)
    current_page?(link) ? "btn-primary" : "btn-default"
  end

end
