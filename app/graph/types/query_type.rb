QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  field :beer do
    type BeerType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Beer.find(args['id'])
    }
  end

  field :brewery do
    type BreweryType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Brewery.find(args['id'])
    }
  end



end
