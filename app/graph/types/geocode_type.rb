GeocodeType = GraphQL::ObjectType.define do
  name 'Geocode'
  description 'Brewery Location'

  field :id, !types.ID
  field :name, !types.String

end
