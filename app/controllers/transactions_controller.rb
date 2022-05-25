class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transaction.where(category_id: params[:category_id]).order('created_at DESC')
    @id = params[:category_id]
  end

  def new
    @id = params[:category_id]
  end

  def create
    transaction = Transaction.new(allowed_params)
    transaction.user_id = current_user.id
    transaction.category_id = params[:category_id]
    redirect_to category_transactions_path(params[:category_id])
    if transaction.save
      flash[:notice] = 'transaction created successfully'
    else
      flash[:alert] = 'An error has occurred while creating the transaction'
    end
  end

  private

  def allowed_params
    params.require(:transaction).permit(:name, :amount)
  end
end
