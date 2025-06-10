class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin        
  def index
    @books=Book.all
  end
  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Access denied. Admins only."
    end
  end

end
