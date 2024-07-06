class List < ApplicationRecord
    has_many :tasks
    has_many :todos, class_name: "List", foreign_key: "parent_list_id"
    belongs_to :parent_list, class_name: "List", optional: true

    validates_presence_of :description
end