class TrackingsController < ApplicationController
  before_action :find_task
  before_action :find_tracking, only: %i[show update destroy]

  def index
    render json: @task.trackings
  end

  def show 
    render json: @tracking
  end

  def create
    @tracking = Tracking.new(tracking_params)

    if @tracking.save
      render json: @tracking
    else
      render json: { error: 'unable to create date'}, status: 400
    end
  end

  def update
    if @tracking 
      @tacking.update(tracking_params)
      render json: { message: 'date is updated'}, status: 200
    else
        render json: { error: 'Unable to update date'}, status: 400
    end
  end

  def destroy
    if @tracking 
      @tracking.destroy
      render json: { message: 'Date is successfully deleted'}, status: 200
    else
        render json: { error: 'unable to delete date...'}, status: 400
    end
  end

  private

  def tracking_params
    params.require(:tracking).permit(:id, :date, :type, :temperature, :task_id, time: [], symtoms: [] )
  end

  def find_task
    @task = Task.find(params[:task_id])
  end

  def find_tracking
    @tracking = Tracking.find(params[:id])
  end

end
