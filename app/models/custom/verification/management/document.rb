require_dependency Rails.root.join('app', 'models', 'verification', 'management', 'document').to_s

class Verification::Management::Document
  def in_census?
    # this always returns false because user never exists
    return false unless user?
    response = CensusApi.new.call(document_type, document_number, user.date_of_birth)
    response.valid? && valid_age?(response)
  end
end
