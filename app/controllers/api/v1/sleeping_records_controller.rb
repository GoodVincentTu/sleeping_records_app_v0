class Api::V1::SleepingRecordsController < ApiController
  def index
    render json: records
  end

  def check_in
    record = current_user.sleeping_records.new(started_at: params[:started_at])
    if record.save!
      render json: record
    else
      render json: {errors: ["Fail to create record"]}, status: 400
    end
  end

  def check_out
    record = current_user.sleeping_records.find(params[:id])
    if record.update!(ended_at: params[:ended_at])
      render json: record
    else
      render json: {errors: ["Fail to create record"]}, status: 400
    end
  end

  def destroy
    record = current_user.sleeping_records.find(params[:id])
    if record.destroy!
      render json: {}, status: 204
    else
      render json: {errors: ["Fail to destroy the data"]}, status: 400
    end
  end

  private

  def records
    current_user.sleeping_records.order("created_at DESC")
  end
end
