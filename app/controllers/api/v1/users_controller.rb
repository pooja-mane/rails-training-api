module Api
  module V1
    class UsersController < BaseController

      def index
        users = User.all
        render_success(
          data: { users: users, count: users.length },
          message: I18n.t('users.list')
        )
      end
    end
  end
end