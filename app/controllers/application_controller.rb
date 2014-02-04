class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound,   with: :rescue_record_not_found
  rescue_from PG::InvalidTextRepresentation,  with: :rescue_bad_request


  private

  def rescue_record_not_found(error)
    render :json => { :error => error.message }, :status => :not_found
  end

  def rescue_bad_request(error)
    render :json => { :error => error.message.strip }, :status => :bad_request
  end
end
