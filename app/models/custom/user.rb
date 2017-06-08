require_dependency Rails.root.join('app', 'models', 'user').to_s

class User
  before_create :set_verified if Setting["feature.#{:auto_verify_users}"]

  def set_verified
    self.verified_at = Time.current
    self.residence_verified_at = Time.current
  end
end
