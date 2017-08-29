require_dependency Rails.root.join('app', 'models', 'user').to_s

class User
  before_create :set_verified

  def set_verified
    return unless Setting["feature.auto_verify"]

    self.verified_at = Time.current
    self.residence_verified_at = Time.current
  end
end
