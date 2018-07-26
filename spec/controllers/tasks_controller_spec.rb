require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:task) { create :task }

  before(:each) do
    @user = create :user
    sign_in @user
  end

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      new_task = task
      get :show, params: { id: new_task.id }
      expect(response).to render_template('show')
    end
  end

  describe 'GET edit' do
    it 'renders the edit template' do
      new_task = task
      get :edit, params: { id: new_task.id }
      expect(response).to render_template('edit')
    end
  end

  describe 'GET new' do
    it 'renders the new template' do
      new_task = task
      get :new, params: { id: new_task.id }
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    it 'redirects to :index when correct attributes were provided' do
      post :create, params: {
        task: {
          title: 'title',
          description: 'description',
          assigned_to_id: @user.id
        }
      }
      expect(response).to redirect_to(action: :index)
    end

    it 'renders new if bad params were provided' do
      post :create, params: {
        task: {
          title: '123123'
        }
      }
      expect(response).to render_template('new')
    end
  end

  describe 'PUT update' do
    it 'redirects to show if update succeed' do
      new_task = task
      put :update, params: {
        id: new_task.id,
        task: {
          title: 'title123',
          description: 'description123',
          assigned_to_id: @user.id
        }
      }
      expect(response).to redirect_to(action: :show, id: new_task.id)
    end

    it 'renders edit when updated fails' do
      new_task = task
      put :update, params: {
        id: new_task.id,
        task: {
          assigned_to_id: 0
        }
      }
      expect(response).to render_template('edit')
    end
  end

  describe 'DELETE destroy' do
    it 'redirects to index if destroy succeed' do
      new_task = task
      delete :destroy, params: {
        id: new_task.id
      }
      expect(response).to redirect_to(action: :index)
    end
  end
end
