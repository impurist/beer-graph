StyleType = GraphQL::ObjectType.define do
  name 'Style'
  description 'Beer Style'

  field :id, !types.ID
  field :name, !types.String
  field :category, !CategoryType

end