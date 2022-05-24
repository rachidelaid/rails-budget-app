class TransactionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @transactions = Transaction.where(category_id: params[:category_id])
    @id = params[:category_id]
  end

  def new
    @id = params[:category_id]
  end

  def create
    transaction = Transaction.new(allowed_params)
    transaction.user_id = current_user.id
    transaction.category_id = params[:category_id]
    if transaction.save
      redirect_to categories_path
      flash[:notice] = 'transaction created successfully'
    else
      redirect_to categories_path
      flash[:alert] = 'An error has occurred while creating the transaction'
    end
  end

  private

  def allowed_params
    params.require(:transaction).permit(:name, :amount)
  end
end