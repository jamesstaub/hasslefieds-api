class OpenReadController < ProtectedController
  skip_before_action :authenticate, if: :read_action?
  before_action :check_user

  private

  def check_user
    if !current_user
      auth_header = request.headers["Authorization"]
      if auth_header
        token = auth_header.split('=')[1].strip
        set_current_user token
      end

    end
  end

  def read_action?
    action = action_name.to_sym
    action == :show || action == :index
  end
end


# before action
