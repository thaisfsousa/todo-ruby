# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    description { 'Test Todos' }
    completed { false }
  end
end
