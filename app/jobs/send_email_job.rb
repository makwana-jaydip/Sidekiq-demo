# frozen_string_literal: true

class SendEmailJob #< ApplicationJob
  # queue_as :default
  include Sidekiq::Worker

  def perform(id)
    @user = User.find_by(id: id)
    SendingMailer.sending_email(@user).deliver_now
  end
end