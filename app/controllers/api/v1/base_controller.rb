module Api
  module V1
    class BaseController < ApplicationController

      protect_from_forgery with: :null_session
      respond_to :json
      before_filter :set_public_cors

      private

      def set_public_cors
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      end

    end
  end
end
