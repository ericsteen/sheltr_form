class UserQuestionnairesController < InheritedResources::Base

  private

    def user_questionnaire_params
      params.require(:user_questionnaire).permit(:user_id, :questionnaire_id)
    end

end
