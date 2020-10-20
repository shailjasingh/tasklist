# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController do
  before do
    @user = create(:user)
  end

  describe 'GET #new' do
    it 'renders new task creation page' do
      get :new
      assert_template 'tasks/new'
    end
  end

  describe 'GET #index' do
    let(:user) { create(:user) }

    it 'renders all tasks list page' do
      get :index
      assert_template 'tasks/index'
    end

    it 'assigns tasks' do
      get :index
      expect(assigns(:tasks)).not_to be_nil
    end

    it 'tests the sorting order of tasks' do
      complete_task = Task.create(description: I18n.t('test.description'), avatar_url: '',
                                  completed_at: Time.current, user_id: @user.id)
      incomplete_task = Task.create(description: I18n.t('test.description'), avatar_url: '', completed_at: nil, user_id: @user.id)
      get :index
      expect(assigns(:tasks).order('completed_at desc').to_a).to eq([complete_task, incomplete_task])
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }

    it 'creates task' do
      expect do
        post :create, params: { task: { description: I18n.t('test.description'),
                                        avatar_url: I18n.t('test.url'),
                                        user_id: user.id } }
      end.to change(Task, :count).by(1)
    end

    it 'returns valid message' do
      post :create, params: { task: { description: I18n.t('test.description'),
                                      avatar_url: I18n.t('test.url'),
                                      user_id: user.id } }
      expect(flash[:success]).to match(I18n.t('task.messages.success'))
    end

    it 'checks presence of description' do
      post :create, params: { task: { description: '',
                                      avatar_url: I18n.t('test.url'),
                                      user_id: user.id } }
      expect(flash[:danger]).to match(I18n.t('test.errors.description'))
    end
  end

  describe 'POST #mark_complete' do
    let(:task) { create(:task) }

    it 'returns success true message' do
      post :complete, params: { task_id: task.id }, format: :json
      expect(response.body).to match({ status: 'ok' }.to_json)
    end

    it 'changes the value of completed_at' do
      expect do
        post :complete, params: { task_id: task.id }, format: :json
      end.to change { task.reload.completed_at }
    end
  end
end
