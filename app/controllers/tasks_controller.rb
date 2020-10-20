# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Tasks::List.run!(user: current_user)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Tasks::Create.run(task_params.merge(user: current_user))

    if @task.valid?
      flash[:success] = t('task.messages.success')
      redirect_to root_path
    else
      flash[:danger] = @task.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def complete
    task = Tasks::Complete.run(task: find_task!)
    if task.valid?
      render json: { status: :ok, completed_at: task.result&.completed_at&.to_i }
    else
      render json: { status: :unprocessable_entity, error: task.errors.full_messages.to_sentence }
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :avatar_url)
  end

  def find_task!
    task = Tasks::Find.run(task_id: params[:task_id])
    raise ActiveRecord::RecordNotFound, task.errors.full_messages.to_sentence unless task.valid?

    task.result
  end
end
