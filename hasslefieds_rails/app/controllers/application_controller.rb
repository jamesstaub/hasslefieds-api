class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: :json_request?
  force_ssl if: :ssl_configured? # all controller actions must have ssl or else they will error out, EXCEPT in development

  protected
  def json_request?
    request.format.json?
    request.format = :json #forces the request to be asking for return json so this app can only be used as a json api
    # the reson for this is that rails by default expects to return html. we're only looking for json, so this will allow us to make requests without explicitly putting .json in the URI

    # effectively, we're commenting out the protect_from_forgery line
  end


    # all controller actions must have ssl or else they will error out, EXCEPT in development


  def ssl_configured?
    !Rails.env.development?
  end


  # json_rquest? looks for requests that end in .json. if it gets .json

end
