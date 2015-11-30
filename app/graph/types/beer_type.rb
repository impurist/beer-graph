BeerType = GraphQL::ObjectType.define do
  name 'Beer'
  description 'The best type of beverage in the world'

  field :id, !types.ID
  field :name, !types.String
  field :abv, !types.String
  field :ibu, !types.String
  field :srm, !types.String
  field :upc, !types.String
  field :filepath, !types.String
  field :description, !types.String
  field :brewery, !BreweryType
  field :category, !CategoryType
  field :style, !StyleType

end
