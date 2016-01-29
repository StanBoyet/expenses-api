module Api
  module V1
    class UsersController < BaseController

      def index
        render status: 200, json: { users: User.all }
      end

      def show
        return record_not_found unless user
        render status: 200, json: { user: user }
      end

      def create
        user = User.create(user_params)
        if user.save
          render status: 200, json: { user: user }
        else
          render status: 400, json: { message: user.errors.full_messages }
        end
      end

      def update
        updated_user = User.find(user_params[:id]).update(user_params)
        return record_not_found unless updated_user
        render status: 200, json: { user: updated_user }
      end

      def destroy
        return record_not_found unless user
        user.destroy
        render status: 200, json: { user: user }
      end

      private

      attr_reader :user
      def user
        @user ||= User.find_by(id: params[:id])
      end

      def record_not_found
        render status: 404, json: { message: 'record not found' }
      end

      def user_params
        params.require(:user).permit(:username)
      end
    end
  end
end
