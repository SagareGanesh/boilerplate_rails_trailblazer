class V1::ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount
end