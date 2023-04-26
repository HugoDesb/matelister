class Invite < ApplicationRecord
  belongs_to :matelist

  before_create :set_status

  validates :email, uniqueness: { scope: :matelist_id, message: 'This invite has already been sent.' }
  has_secure_token :code, length: 36



  private

  def set_status
    self.status = :sent
  end

  def persist_with_random_token!(attempts = 10)
    retries ||= 0
    code = SecureRandom.urlsafe_base64(nil, false)
    save!
  rescue ActiveRecord::RecordNotUnique => e
    raise if (retries += 1) > attempts

    Rails.logger.warn("random token, unlikely collision number #{retries}")
    code = SecureRandom.urlsafe_base64(16, false)
    retry
  end
end
