class ListsController < ApplicationController
  before_action :set_list, only: [:update, :show, :destroy, :edit]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Todo criado com sucesso."
      redirect_to lists_path
    else
      flash.now[:alert] = @list.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @list.update(list_params)
      flash[:notice] = "Todo atualizado com sucesso."
      redirect_to lists_path
    else
      flash.now[:alert] = @list.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
  end

  def destroy
    @list.destroy
    flash[:notice] = "Todo deletado com sucesso."
    redirect_to lists_path
  end

  def edit
  end

  private

  def list_params
    params.require(:list).permit(:completed, :description, :parent_list_id)
  end

  def set_list
    @list = List.find(params[:id])
  end
end