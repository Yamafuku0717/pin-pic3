class MemosController < ApplicationController
  before_action :set_picture, except: :create
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def create
    Memo.create(memo_params)
    redirect_to picture_path(id: params[:picture_id])
  end

  def show
    @link = Memo.find(params[:id])
  end

  def edit
    @link = Memo.find(params[:id])
  end

  def update
    link = Memo.find(params[:id])
    link.update_attributes(momo_edit_params)
    redirect_to picture_path(@picture)
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to picture_path(@picture)
  end

  private

  def memo_params
    params.require(:memo).permit(:info, :image).merge(picture_id: params[:picture_id], offsetX: params[:offsetX], offsetY: params[:offsetY])
  end
  
  def momo_edit_params
    params.require(:memo).permit(:info, :image)
  end

  def set_picture
    @picture = Picture.find(params[:picture_id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @picture.user.id
  end
end
