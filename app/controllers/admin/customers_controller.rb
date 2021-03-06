class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @q = Customer.ransack(params[:q])
    @customers = @q.result(distinct: true).order(name: :asc).page(params[:page]).per(12)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "プロフィールを更新しました"
    else
      render "edit", alert: "更新に失敗しました"
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :profile_image_id, :is_deleted)
  end
end
