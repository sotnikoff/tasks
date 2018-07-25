class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update show destroy]
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "#{Task.model_name.human} updated!"
    else
      render :edit
    end
  end

  def create
    task = Task.new(task_params)
    task.author = current_user
    if task.save
      redirect_to tasks_path, notice: "#{Task.model_name.human} created!"
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "#{Task.model_name.human} deleted!"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :assigned_to_id)
  end
end
