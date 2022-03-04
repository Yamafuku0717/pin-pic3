class MyListsController < ApplicationController
  def create
    @my_list = MyList.new(my_list_params)
    if @my_list.save
      redirect_to picture_path(id: params[:picture_id])
    end
  end

  private
  def my_list_params
    params.require(:my_list).permit(:list_name).merge(user_id: current_user.id)
  end
end
