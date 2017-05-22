require_dependency Rails.root.join('app', 'models', 'verification', 'residence').to_s

class Verification::Residence

  def geozone
  end

  def gender
    user.gender
  end

  private

    def call_census_api
      @census_api_response = CensusApi.new.call(document_type, document_number, date_of_birth)
      unless residency_valid?
        errors.add(:residence, false)
        store_failed_attempt
        Lock.increase_tries(user)
      end
    end

    def residency_valid?
      @census_api_response && @census_api_response.valid?
    end
end
