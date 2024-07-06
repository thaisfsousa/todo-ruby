class TasksController < ApplicationController
  before_action :set_task, only: [:update, :show, :destroy, :edit]

  def index
    @list = List.find(params[:list_id])
    @tasks = Task.all
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task.update(list_id: params[:id])
    if @task.save
      flash[:notice] = "Task criada com sucesso."
      redirect_to @task
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @list = List.find(params[:list_id])
    if @task.update(task_params)
      flash[:notice] = "Task atualizada com sucesso."
      redirect_to @task
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
  end

  def destroy
    @list = List.find(params[:list_id])
    @task.destroy
    flash[:notice] = "Task deletada com sucesso."
    redirect_to list_task_path
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:completed, :description, :parent_task_id)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

end
