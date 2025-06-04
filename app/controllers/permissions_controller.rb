class PermissionsController < ApplicationController
before_action :authenticate_user!
  def create
    @book=Book.find(params[:book_id])
    permission=current_user.permissions.find_or_initialize_by(book:@book)
    permission.status ="pending"
    if permission.save 
      redirect_to book_path(@book), notice: "Request sent to book owner"
    else 
      redirect_to books_path, alert: "unable to send request"
    end
  end

  def approve
    permission=Permission.find(params[:id])
    if permission.book.user==current_user
      permission.update(status: 'approved')
      redirect_to book_path(permission.book), notice: "access approved"
    else
      redirect_to books_path
    end
  end

  def reject
    permission=Permission.find(params[:id])
    if permission.book.user==current_user
      permission.update(status: 'rejected')
      redirect_to book_path(permission.book), notice: "access rejected"
    else 
      redirect_to books_path
    end
 end

end
