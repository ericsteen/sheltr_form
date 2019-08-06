class SectionsController < InheritedResources::Base

  private

    def section_params
      params.require(:section).permit(:name, :questionnaire_id)
    end

end
