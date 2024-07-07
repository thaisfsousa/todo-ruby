# frozen_string_literal: true

# This device create, update, show, destroy a Todo List
class TodosController < ApplicationController
  before_action :set_todo, only: %i[update show destroy edit]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = 'Todo criado com sucesso.'
      redirect_to todos_path
    else
      flash.now[:alert] = @todo.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = 'Todo atualizado com sucesso.'
      redirect_to todos_path
    else
      flash.now[:alert] = @todo.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show; end

  def destroy
    puts "Destroy action called for todo ID: #{params[:id]}"
    @todo.destroy!
    flash[:notice] = 'Todo deletado com sucesso.'
    redirect_to todos_path
  end

  def edit; end

  private

  def todo_params
    params.require(:todo).permit(:completed, :description, :parent_todo_id)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
