CategoryType = GraphQL::ObjectType.define do
  name 'Category'
  description 'Category of Beer'

  field :id, !types.ID
  field :name, !types.String

end
