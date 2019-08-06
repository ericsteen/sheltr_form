class QuestionsController < InheritedResources::Base

  private

    def question_params
      params.require(:question).permit(:name, :description, :input_type)
    end

end
