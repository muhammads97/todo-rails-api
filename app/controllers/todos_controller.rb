class TodosController < ApplicationController
	before_action :get_list
	before_action :get_todo, only: [:show, :update, :destroy]

  def index 
		@todos = @list.Todo.all 
		render json: {todos: @todos}
  end

  def create 
		@todo = @list.Todo.new(todo_params)
		@todo.list_id = @list.id
		@todo.done = false
		if @todo.save
			render json: {todo: @todo}
		else
			render json: {error: "invalid todo"}
		end
  end

  def show
		# @todo = @list.Todo.find(params[:id])
		render json: {todo: @todo}
  end

  def update
		# @todo = @list.Todo.find(params[:id])
		if @todo.update(todo_params)
			render json: {todo: @todo}
		else
			render json: {error: "invalid todo"}
		end
  end

  def destroy
		@todo.destroy
	end
		
	private
		def get_list
			@list = @user.List.find(params[:list_id])
			if !@list
				render json: {error: "List not found"}
			end
		end

		def get_todo
			@todo = @list.Todo.find(params[:id])
		end

		def todo_params
			params.permit(:todo, :done)
		end
end
