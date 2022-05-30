module Api
  module V2
    class UsersController < BaseController
      def index
        users = User.all
        render_success(
          data: { users: users.map(&:short_response), count: users.length },
          message: I18n.t('users.list')
        )
      end
    end
  end
end