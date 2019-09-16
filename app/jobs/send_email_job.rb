# frozen_string_literal: true

class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(id)
    user = User.find_by(id: id)
    SendingMailer.sending_email(user).deliver_later
  end
end