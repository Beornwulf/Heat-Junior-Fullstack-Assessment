# frozen_string_literal: true

module Api
  module V1
    class PetsController < ApplicationController

      def index
        
        if params[:sorting]
          sorting = []
          fields = Pet.column_names
          params[:sorting].split(',').each do |field|
            if fields.include? field
              sorting.push(field)
            end
          end
          sorting = sorting.join(", ")
        else
          sorting = "featured, name"
        end

        if params[:species]
          pets = Pet.where("species = ?", params[:species]).order(sorting)
        else
          pets = Pet.all.order(sorting)
        end
        render json: pets, status: :ok
      end

    end
  end
end
