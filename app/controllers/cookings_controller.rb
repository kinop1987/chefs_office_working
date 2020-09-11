class CookingsController < ApplicationController
  before_action :authenticate_order!
  before_action :set_up_cooking, only: [:show, :edit, :uidate, :destroy]
  before_action :check_collect_order, only: [:show, :edit, :update, :detroy]
  

  def index
    @cookings = current_order.cookings.order("created_at DESC").page(params[:page]).per(10)
  end
  
  def new
    @cooking = Cooking.new
    @cooking.images.new
  end

  def create
    @cooking = Cooking.new(cooking_params)
    if params[:cooking][:images_attributes] && @cooking.save
      redirect_to action: :index , notice: "レシピを投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      @cooking.images.new
      render :new
    end
  end

  def show
  end

  private
    def cooking_params
      params.require(:cooking).permit(:name, :text, images_attributes: [:name]).merge(order_id: current_order.id)
    end

    def check_collect_order
      if @cooking.order_id != current_order.id
        flash.now[:alert] = "権限がありません"
        render root_path
      end
    end
    
    def set_up_cooking
      @cooking = Cooking.find(params[:id])
    end


end
