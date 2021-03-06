module Api
  module V1
    class UsersController < BaseController

      def index
        users = User.all

        ## without any method
        render_success(
          data: { users: users },
          message: I18n.t('users.list')
        )

        ## using as_json
        # render_success(
        #   data: { users: users.as_json(only: %i[id email]) },
        #   message: I18n.t('users.list')
        # )

        ## using active model serializer
        # render_success(
        #   data: { users: serialize_resource(users, Api::V1::UserSerializer) },
        #   message: I18n.t('users.list')
        # )
      end

      def show
        user = User.find(params[:id])

        render_success(data: { user: serialize_resource(user, Api::V1::UserSerializer) },
                       message: I18n.t('users.show.success'))
      end
    end
  end
end
