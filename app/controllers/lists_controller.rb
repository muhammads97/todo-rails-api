class ListsController < ApplicationController
  def index
    @lists = @user.List.all
    render json: {lists: @lists}
  end

  def create 
    @list = List.new(list_params)
    @list.user_id = @user.id
    if @list.save
      render json: {list: @list}
    else
      render json: {error: "invalid list name"}
    end
  end

  def show
    @list = @user.List.find(params[:id])
    if @list
      render json: {list: @list}
    else
      render json: {error: "not found"}
    end
  end

  def destroy
    @list = @user.List.find(params[:id])
    @list.destroy
  end

  private
    def list_params
      p = params.permit(:name)
    end
end
