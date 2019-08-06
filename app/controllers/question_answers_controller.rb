class QuestionAnswersController < InheritedResources::Base

  private

    def question_answer_params
      params.require(:question_answer).permit(:name, :value, :score, :question_id, :user_id)
    end

end
