# frozen_string_literal: true

module Api
  module V1
    class PetsController < ApplicationController

      def index
        if params[:species]
          pets = Pet.where("species = ?", params[:species]).order(:featured, :name)
        else
          pets = Pet.all.order(:featured, :name)
        end
        render json: pets, status: :ok
      end

    end
  end
end
