# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let(:valid_attributes) do
    { description: 'Test Todo', completed: false }
  end
  let(:invalid_attributes) do
    { description: nil }
  end
  describe 'GET #index' do
    it 'returns a success response' do
      Todo.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end
  describe 'GET #show' do
    it 'returns a success response' do
      todo = Todo.create! valid_attributes
      get :show, params: { id: todo.to_param }
      expect(response).to be_successful
    end
  end
  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end
  describe 'GET #edit' do
    it 'returns a success response' do
      todo = Todo.create! valid_attributes
      get :edit, params: { id: todo.to_param }
      expect(response).to be_successful
    end
  end
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Todo' do
        expect do
          post :create, params: { todo: valid_attributes }
        end.to change(Todo, :count).by(1)
      end
      it 'redirects to the created todo' do
        post :create, params: { todo: valid_attributes }
        expect(response).to redirect_to(todos_path)
      end
    end
    context 'with invalid params' do
      it 'returns a success response (i.e. to display the \'new\' template)' do
        post :create, params: { todo: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { description: 'Updated Todo', completed: true }
      end
      it 'updates the requested todo' do
        todo = Todo.create! valid_attributes
        put :update, params: { id: todo.to_param, todo: new_attributes }
        todo.reload
        expect(todo.description).to eq('Updated Todo')
        expect(todo.completed).to be_truthy
      end
      it 'redirects to the todo' do
        todo = Todo.create! valid_attributes
        put :update, params: { id: todo.to_param, todo: new_attributes }
        expect(response).to redirect_to(todos_path)
      end
    end
    context 'with invalid params' do
      it 'returns a success response (i.e. to display the \'edit\' template)' do
        todo = Todo.create! valid_attributes
        put :update, params: { id: todo.to_param, todo: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
  describe 'DELETE #destroy' do
    it 'destroys the requested todo' do
      todo = Todo.create! valid_attributes
      expect do
        delete :destroy, params: { id: todo.to_param }
      end.to change(Todo, :count).by(-1)
    end
    it 'redirects to the todos list' do
      todo = Todo.create! valid_attributes
      delete :destroy, params: { id: todo.to_param }
      expect(response).to redirect_to(todos_url)
    end
  end
end
