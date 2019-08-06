class UserAnswersController < InheritedResources::Base

  private

    def user_answer_params
      params.require(:user_answer).permit(:question_id, :user_id, :score)
    end

end
