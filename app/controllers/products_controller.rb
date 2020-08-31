class ProductsController < ApplicationController
  before_action :authenticate_supplier!
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :check_collect_supplier, except: [:index, :new, :create]

  def index
    @products = current_supplier.products
  end

  def new
    @form = Form::ProductCollection.new
  end

  def create
    @form = Form::ProductCollection.new(product_collection_params)
    if @form.save
      redirect_to products_path, notice: "商品を登録しました"
    else
      flash.now[:alert] = "商品登録に失敗しました"
      render :new
    end

  end

  def exit
  end

  def update
    if @product.update(update_product_params)
      redirect_to products_path, notice: "商品情報を編集しました"
    else
      flash.now[:alert] = "商品情報の編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "商品を削除しました"

  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_collection_params
        params
          .require(:form_product_collection).permit(products_attributes: [:product_name, :product_price, :product_unit, :availability, :supplier_id])
      end

      def update_product_params
        params.require(:product).permit(:product_name, :product_price, :product_unit)
      end

    def check_collect_supplier
      if @product.supplier_id != current_supplier.id
        redirect_to root_path , alert: "権限がありません"
      end
    end
end
