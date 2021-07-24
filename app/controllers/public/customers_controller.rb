class Public::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).reverse_order
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer), notice: "プロフィールを更新しました"
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image_id, :introduction, :is_deleted)
  end

end
