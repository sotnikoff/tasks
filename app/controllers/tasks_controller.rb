class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update show destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def edit; end

  def update; end

  def create; end

  def new; end

  def destroy; end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end
