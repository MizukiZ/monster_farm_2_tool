class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: 'Record not found' }, status: 404
  end
end
