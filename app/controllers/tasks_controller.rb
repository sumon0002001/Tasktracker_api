class TasksController < ApplicationController
  before_action :find_user
  before_action :find_task, only: %i[show update destroy]

  def index
    render json: @user.tasks
  end

  def show
    render json: @task
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task
    else

      render json: { error: 'Unable to create Task' }, status: 400
    end
  end

  def update
    if @task
      @task.update(task_params)
      render json: { message: 'task succesfully updated' }, status: 200
    else
      render json: { error: 'Unable to update Task' }, status: 400
    end
  end

  def destroy
    if @task
      @task.destroy
      render json: { message: 'task succesfully deleted' }, status: 200
    else
      render json: { error: 'Unable to delete task' }, status: 400
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :user_id, :id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
