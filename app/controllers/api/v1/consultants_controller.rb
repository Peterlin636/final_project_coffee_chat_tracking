class Api::V1::ConsultantsController < Api::V1::GraphitiController
  def index
    consultants = ConsultantResource.all(params)
    respond_with(consultants)
  end

  def show
    consultant = ConsultantResource.find(params)
    respond_with(consultant)
  end

  def create
    consultant = ConsultantResource.build(params)

    if consultant.save
      render jsonapi: consultant, status: 201
    else
      render jsonapi_errors: consultant
    end
  end

  def update
    consultant = ConsultantResource.find(params)

    if consultant.update_attributes
      render jsonapi: consultant
    else
      render jsonapi_errors: consultant
    end
  end

  def destroy
    consultant = ConsultantResource.find(params)

    if consultant.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: consultant
    end
  end
end
