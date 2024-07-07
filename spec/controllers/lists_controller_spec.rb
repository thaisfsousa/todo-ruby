require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:valid_attributes) {
    { description: "Test List", completed: false }
  }

  let(:invalid_attributes) {
    { description: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      list = FactoryBot.create(:list)
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new List" do
        expect {
          post :create, params: { list: valid_attributes }
        }.to change(List, :count).by(1)
      end

      it "redirects to the lists path" do
        post :create, params: { list: valid_attributes }
        expect(response).to redirect_to(lists_path)
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, params: { list: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { description: "Updated List" }
      }

      it "updates the requested list" do
        list = FactoryBot.create(:list)
        put :update, params: { id: list.to_param, list: new_attributes }
        list.reload
        expect(list.description).to eq("Updated List")
      end

      it "redirects to the lists path" do
        list = FactoryBot.create(:list)
        put :update, params: { id: list.to_param, list: valid_attributes }
        expect(response).to redirect_to(lists_path)
      end
    end

    context "with invalid params" do
      it "renders the edit template" do
        list = FactoryBot.create(:list)
        put :update, params: { id: list.to_param, list: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested list" do
      list = FactoryBot.create(:list)
      expect {
        delete :destroy, params: { id: list.to_param }
      }.to change(List, :count).by(-1)
    end

    it "redirects to the lists path" do
      list = FactoryBot.create(:list)
      delete :destroy, params: { id: list.to_param }
      expect(response).to redirect_to(lists_path)
    end
  end
end