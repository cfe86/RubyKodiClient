# frozen_string_literal: true

module KodiClient
  module Types
    module Favourites
      # return type for Favourites.GetFavourites
      class GetFavouriteReturned
        include Extensions::Comparable
        extend Extensions::Creatable

        attr_reader :favourites, :limits

        type_mapping ['favourites', DetailsFavourite, true], ['limits', Types::List::ListLimitsReturned]

        def initialize(favourites, limits)
          @favourites = favourites
          @limits = limits
        end
      end
    end
  end
end
