module Api
  module V1
    class ExpensesController < BaseController

      def index
        render status: 200, json: { expenses: Expense.all }
      end

      def show
        return record_not_found unless expense
        render status: 200, json: { expense: expense }
      end

      def create
        expense = Expense.create(expense_params)
        if expense.save
          render status: 200, json: { expense: expense }
        else
          render status: 400, json: { message: expense.errors.full_messages }
        end
      end

      def update
        updated_expense = Expense.find(expense_params[:id]).update(expense_params)
        return record_not_found unless updated_expense
        render status: 200, json: { expense: updated_expense }
      end

      def destroy
        return record_not_found unless expense
        expense.destroy
        render status: 200, json: { expense: expense }
      end

      private

      attr_reader :expense
      def expense
        @expense ||= Expense.find_by(id: params[:id])
      end

      def record_not_found
        render status: 404, json: { message: 'record not found' }
      end

      def expense_params
        params.require(:expense).permit(:user_id, :amount, :note, :category_id)
      end

    end
  end
end
