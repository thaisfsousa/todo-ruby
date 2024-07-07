# frozen_string_literal: true

# Module containing helper methods for Todo model.
class Todo < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates_presence_of :description
end
