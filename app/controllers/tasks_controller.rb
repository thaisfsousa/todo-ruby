# frozen_string_literal: true

# This device create, update, show, destroy a Task into Todo List
class TasksController < ApplicationController
  before_action :set_todo
  before_action :set_task, only: %i[update show destroy edit]

  def index
    @tasks = @todo.tasks
  end

  def new
    @task = @todo.tasks.new
  end

  def create
    @task = @todo.tasks.new(task_params)
    if @task.save
      flash[:notice] = 'Task criada com sucesso.'
      redirect_to todo_tasks_path(@todo)
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Task atualizada com sucesso.'
      redirect_to todo_task_path(@todo, @task)
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show; end

  def destroy
    @task.destroy
    flash[:notice] = 'Task deletada com sucesso.'
    redirect_to todo_tasks_path(@todo)
  end

  def edit; end

  private

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def task_params
    params.require(:task).permit(:completed, :description)
  end

  def set_task
    @task = @todo.tasks.find(params[:id])
  end
end
