# frozen_string_literal: true

# Module containing helper methods for Mailer class.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
