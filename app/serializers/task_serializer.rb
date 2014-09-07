class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :completed_on
  has_one :team
end
