class BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_header, :authenticate

  def validate_header
    return unless invalid_header

    render_error(errors: [I18n.t('errors.invalid_headers')], status: :precondition_failed)
  end

  def authenticate
    return unless request.headers['access-token'].blank?
      
    render_error(errors: I18n.t('errors.unauthorized'), status: precondition_failed)
  end

  def render_success(data: nil, message: nil, status: :ok)
    render json: { data: data, message: message }, status: status
  end

  def render_error(errors: nil, status: :internal_server_error)
    render json: { errors: errors }, status: status
  end

  def invalid_header
    request.headers['client'].blank? || request.headers['uid'].blank?
  end

  def serialize_resource(resources, serializer, root = nil, extra = {})
    opts = { each_serializer: serializer, root: root }.merge(extra)
    ActiveModelSerializers::SerializableResource.new(resources, opts) if resources
  end
end
