class MemosController < ApplicationController
  before_action :collect_access_chekking
  before_action :set_memo, only: %i[show edit update destroy]

  def index
    @memos = current_order.memos.all
  end

  def show; end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to memos_path, notice: 'メモを作成しました'
    else
      flash.now[:alert] = 'メモ作成に失敗しました'
      render :new
    end
  end

  def edit; end

  def update
    if @memo.update(memo_params)
      redirect_to memos_path, notice: 'メモを編集しました'

    else
      flash.now[:alert] = 'メモの編集に失敗しました'
      render :edit
    end
  end

  def destroy
    redirect_to memos_path, alert: 'メモを削除しました' if @memo.destroy
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
      flash.now[:alert] = '正常なアクセスではありません'
      render root_path
    end
  end

  def collect_access_chekking
    redirect_to root_path unless order_signed_in?
  end
end
