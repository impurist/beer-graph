BreweryType = GraphQL::ObjectType.define do
  name 'Brewery'
  description 'Beer Maker'
  
  field :id, !types.ID
  field :name, !types.String
  field :address1, !types.String
  field :address2, !types.String
  field :city, !types.String
  field :state, !types.String
  field :code, !types.String
  field :country, !types.String
  field :phone, !types.String
  field :website, !types.String
  field :filepath, !types.String
  field :description, !types.String

  field :beers do
    type -> { types[!BeerType] }
    description "Beers made by this Brewery"
    resolve -> (obj, args, ctx) do
      obj.beers
    end
  end

  field :styles do
    type -> { types[!StyleType] }
    description "Styles made by this Brewery"
    resolve -> (obj, args, ctx) do
      obj.styles
    end
  end

end
