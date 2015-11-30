QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  field :beers do
    type !types[!BeerType]
    argument :limit, types.Int, default_value: 20
    resolve -> (obj, args, ctx) {
      Beer.limit(args['limit'])
    }
  end

  field :beer do
    type BeerType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Beer.find(args['id'])
    }
  end

  field :breweries do
    type !types[!BreweryType]
    argument :limit, types.Int, default_value: 20
    resolve -> (obj, args, ctx) {
      Brewery.limit(args['limit'])
    }
  end

  field :brewery do
    type BreweryType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Brewery.find(args['id'])
    }
  end

  field :styles do
    type !types[!StyleType]
    argument :limit, types.Int, default_value: 20
    resolve -> (obj, args, ctx) {
      Style.limit(args['limit'])
    }
  end


end
