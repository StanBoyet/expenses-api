module Api
  module V1
    class CategoriesController < BaseController

      def index
        render status: 200, json: { categories: Category.all }
      end

      def show
        return record_not_found unless category
        render status: 200, json: { category: category }
      end

      def create
        category = Category.create(category_params)
        if category.save
          render status: 200, json: { category: category }
        else
          render status: 400, json: { message: category.errors.full_messages }
        end
      end

      def update
        updated_category = Category.find(category_params[:id]).update(category_params)
        return record_not_found unless updated_category
        render status: 200, json: { category: updated_category }
      end

      def destroy
        return record_not_found unless category
        category.destroy
        render status: 200, json: { category: category }
      end

      private

      attr_reader :category
      def category
        @category ||= Category.find_by(id: params[:id])
      end

      def record_not_found
        render status: 404, json: { message: 'record not found' }
      end

      def category_params
        params.require(:category).permit(:name, :id)
      end
    end
  end
end
