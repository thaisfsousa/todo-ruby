class TasksController < ApplicationController
  before_action :set_task, only: [:update, :show, :destroy, :edit]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)
  
    if @task.save
      flash[:notice] = "Task criada com sucesso."
      redirect_to [@list, @task]
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task atualizada com sucesso."
      redirect_to [@list, @task]
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task deletada com sucesso."
    redirect_to [@list, @task]
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:completed, :description, :parent_task_id)
  end

  def set_task
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:task_id])
  end

end
