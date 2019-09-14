class User < ApplicationRecord
  after_create :send_email

  def send_email
    # this call the job perform in background
    user_id = self.id
    SendEmailJob.perform_async(user_id)
  end
end
