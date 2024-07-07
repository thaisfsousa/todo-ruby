require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:list) { create(:list) }
  let(:task) { create(:task, list: list) }

  let(:valid_attributes) {
    { description: "Test Task", completed: false, list_id: list.id }
  }

  let(:invalid_attributes) {
    { description: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { list_id: list.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { list_id: list.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: { list_id: list.id, task: valid_attributes }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post :create, params: { list_id: list.id, task: valid_attributes }
        expect(response).to redirect_to(Task.last)
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, params: { list_id: list.id, task: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { description: "Updated Task" }
      }

      it "updates the requested task" do
        put :update, params: { list_id: list.id, id: task.id, task: new_attributes }
        task.reload
        expect(task.description).to eq("Updated Task")
      end

      it "redirects to the task" do
        put :update, params: { list_id: list.id, id: task.id, task: new_attributes }
        expect(response).to redirect_to(task)
      end
    end

    context "with invalid params" do
      it "renders the edit template" do
        put :update, params: { list_id: list.id, id: task.id, task: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task = create(:task, list: list)
      expect {
        delete :destroy, params: { list_id: list.id, id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      delete :destroy, params: { list_id: list.id, id: task.id }
      expect(response).to redirect_to(list_task_path)
    end
  end
end