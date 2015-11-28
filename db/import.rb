
require "csv"
require "pathname"

class Import


  MAPPPING = {
    beers: {
      id: 'id',
      brewery_id: 'brewery_id',
      name: 'name',
      cat_id: 'category_id',
      style_id: 'style_id',
      abv: 'abv',
      ibu: 'ibu',
      srm: 'srm',
      upc: 'upc',
      filepath: 'filepath',
      descript: 'description',
      add_user: 'add_user',
      last_mod: 'last_modified' 
    },
    breweries: {
      id:'id',
      name: 'name',
      address1: 'address1',
      address2: 'address2',
      city: 'city',
      state: 'state',
      code: 'code',
      country: 'country',
      phone: 'phone',
      website: 'website',
      filepath: 'filepath',
      descript: 'description',
      add_user: 'add_user',
      last_mod: 'last_modified'
    },
    categories: {
      id: 'id',
      cat_name: 'name',
      last_mod: 'last_modified'
    },
    geocodes: {
      id: 'source_id',
      brewery_id: 'brewery_id',
      latitude: 'latitude',
      longitude: 'longitude',
      accuracy: 'accuracy'
    },
    styles: {
      id: 'id',
      cat_id: 'categoryid',
      style_name: 'name',
      last_mod: 'last_modified'
    }
    
  }

  def client
    @client ||= Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'world-beer-hack')
  end

  def import

  	dumps = Dir.glob("#{Dir.pwd}/dumps/*.csv")


  	dumps.each do |dump| 
  		dump_path = Pathname.new(dump)
  		i  = 0
  		keys = []
  		CSV.foreach(dump_path) do |row|
  			if i == 0	
  				keys = row
  			else
  				model = Hash.new
  				collection = dump_path.basename.to_s.sub(".csv", "")
          keys.each_with_index do |key, i|
            new_key = MAPPPING[collection.to_sym][key.to_sym]
            model[new_key] = row[i]
  				end
  				
          p model

          # client[collection].insert_one(model)

  			end 

  			i+=1
  		end

  	end	
  end

end

