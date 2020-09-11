class CookingsController < ApplicationController
  before_action :authenticate_order!
  before_action :set_up_cooking, only: [:show, :edit, :update, :destroy]
  before_action :check_collect_order, only: [:show, :edit, :update, :detroy]
  before_action :search_cookings, only: [:index, :search]
  

  def index
    @cookings = current_order.cookings.order("created_at DESC").page(params[:page]).per(10)
  end

  def search
    @results = @search.result(distinct: true).page(params[:page]).per(10)
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

  def edit
  end

  def update
    if params[:cooking][:images_attributes] && @cooking.update(edit_cooking_params)
      redirect_to cookings_path, notice: "レシピを編集しました"
    else
      flas.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @cooking.destroy
    redirect_to cookings_path, notice: "レシピを削除しました"
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

    def edit_cooking_params
      params.require(:cooking).permit(:name, :text, images_attributes: [:name, :_destroy, :id])
    end

    def search_cookings
      @search = current_order.cookings.ransack(params[:q])
    end



end
