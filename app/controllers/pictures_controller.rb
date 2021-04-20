class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :user, :search]
  before_action :search_pictures, only: [:index, :create, :user, :search]
  before_action :set_picture, only: [:show, :update, :destroy]
  before_action :move_to_index, only: :destroy

  def index 
    @pictures = Picture.where(public_private: "公開").includes(:user).order('created_at DESC')
    @picture = Picture.new
  end

  def new 
    @picture = Picture.new
  end

  def create 
    @pictures = Picture.where(public_private: "公開").includes(:user).order('created_at DESC')
    @picture = Picture.new(picture_params)
    @memo = Memo.new
    if @picture.save
      render :show
    else
      render :index
    end
    if user_signed_in?
      gon.current_user_id = current_user.id
      gon.picture_user_id = @picture.user.id
    end
    
  end

  def show 
    @memo = Memo.new
    @links = @picture.memos
    if user_signed_in?
      gon.current_user_id = current_user.id
      gon.picture_user_id = @picture.user.id
    end
  end

  def edit 
  end

  def update
    @picture.update(update_picture)
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture.destroy
    redirect_to root_path
  end

  def user
    @user = User.find(params[:id]) 
    @private_pictures = @user.pictures.where(public_private: "非公開").order('created_at DESC')
    @public_pictures = @user.pictures.where(public_private: "公開").order('created_at DESC')
    @favorites = @user.favorites
  end

  def search
    @results = @p.result.includes(:user).order('created_at DESC')
    @picture = Picture.new
    render :index
  end

  private

  def picture_params
    params.require(:picture).permit(:text, :image, :public_private).merge(user_id: current_user.id)
  end

  def search_pictures
    @p = Picture.ransack(params[:q])
  end

  def update_picture
    params.require(:picture).permit(:public_private)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @picture.user.id
  end
end
