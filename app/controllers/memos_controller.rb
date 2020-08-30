class MemosController < ApplicationController
  before_action :authenticate_order!
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  def index
    @memos = current_order.memos.all
  end
  
  def show
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to memos_path, notice: "メモを作成しました"
    end
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
      redirect_to memos_path, notice: "メモを編集しました"
    end
  end

  def destroy
    if @memo.destroy
      redirect_to memos_path, alert: "メモを削除しました"
    end
  end

  private
  def memo_params
    params.require(:memo).permit(:text).merge(order_id: current_order.id)
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end
  
  def check_order_id
    if @memo.order_id != current_order.id
      flash.now[:alert] = "正常なアクセスではありません"
      render root_path
    end
  end

end
