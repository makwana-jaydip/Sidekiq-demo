class User < ApplicationRecord
  after_commit :send_email, on: :create

  def send_email
    # this call the job perform in background
    user_id = self.id
    SendEmailJob.perform_later(user_id)
  end
end
