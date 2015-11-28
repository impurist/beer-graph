require 'csv'
require 'pathname'

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
      },
      categories: {
          id: 'id',
          cat_name: 'name',
      },
      geocodes: {
          id: 'id',
          brewery_id: 'brewery_id',
          latitude: 'latitude',
          longitude: 'longitude',
          accuracy: 'accuracy'
      },
      styles: {
          id: 'id',
          cat_id: 'category_id',
          style_name: 'name',
      }

  }

  def import

    dumps = Dir.glob("#{Rails.root}/db/data/*.csv")


    dumps.each do |dump|
      dump_path = Pathname.new(dump)
      i  = 0
      keys = []
      CSV.foreach(dump_path) do |row|
        if i == 0
          keys = row
        else
          model_attr = Hash.new
          collection = dump_path.basename.to_s.sub('.csv', '')
          keys.each_with_index do |key, i|
            new_key = MAPPPING[collection.to_sym][key.to_sym]
            model_attr[new_key] = row[i] if new_key
          end
          model_class = collection.singularize.classify.constantize
          p model_attr
          p model_class.create(model_attr)

        end

        i+=1
      end

    end
  end

end


Import.new.import