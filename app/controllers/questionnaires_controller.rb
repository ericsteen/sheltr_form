class QuestionnairesController < InheritedResources::Base
  respond_to :json

  def index
    @questionnaire = Questionnaire.get(params["questionnaire"])
    respond_with @questionnaire.as_json
  end

  private

    def questionnaire_params
      params.require(:questionnaire).permit(:name, :description, :user_id)
    end

end
