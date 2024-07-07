FactoryBot.define do
    factory :list do
      description { "Test List" }
      completed { false }
      parent_list { nil }
    end
  end