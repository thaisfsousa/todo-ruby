# frozen_string_literal: true

# Module containing helper methods for Task model.
class Task < ApplicationRecord
  belongs_to :todo

  validates_presence_of :description
end
