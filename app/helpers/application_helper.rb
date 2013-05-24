module ApplicationHelper

  def signed_in?
    return true if session[:id]
  end

  def current_user
    if session[:id]
      @current_user ||= Teacher.find(session[:id])
    end
  end

end
