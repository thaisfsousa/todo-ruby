# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    description { 'Test Tasks' }
    completed { false }
  end
end
