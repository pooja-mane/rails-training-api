module V1
  class UsersController < BaseController

    def index
      users = User.all

      render_success(
        data: { users: users },
        message: I18n.t('users.list')
      )
    end
  end
end
