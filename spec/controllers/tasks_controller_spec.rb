# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:todo) { create(:todo) }
  let(:task) { create(:task, todo:) }
  describe 'POST #create' do
    context 'with valid params' do
      it 'redirects to the created task' do
        post :create, params: { todo_id: todo.id, task: { description: 'New Task', completed: false } }
        expect(response).to redirect_to(todo_tasks_path(todo))
        expect(flash[:notice]).to eq('Task criada com sucesso.')
      end
    end
  end
  describe 'PUT #update' do
    context 'with valid params' do
      it 'redirects to the task' do
        put :update, params: { todo_id: todo.id, id: task.id, task: { description: 'Updated Task', completed: true } }
        expect(response).to redirect_to(todo_task_path(todo, task))
        expect(flash[:notice]).to eq('Task atualizada com sucesso.')
      end
    end
  end
  describe 'DELETE #destroy' do
    it 'redirects to the tasks list' do
      delete :destroy, params: { todo_id: todo.id, id: task.id }
      expect(response).to redirect_to(todo_tasks_path(todo))
      expect(flash[:notice]).to eq('Task deletada com sucesso.')
    end
  end
end
