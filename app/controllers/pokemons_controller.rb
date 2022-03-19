class PokemonsController < ApplicationController
  require 'csv'

  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  def show
    begin
      find_pokemon
      if @pokemon
        render json: @pokemon, status: :ok
      else
        render json: { error: 'Unable to get pokemon'}, status: :bad_request
      end
    rescue ActiveRecord::RecordNotFound
      head :not_found
    end
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render json: @pokemon, status: :ok
    else
      render json: { error: 'Unable to create pokemon' }, status: :bad_request
    end
  end

  def update
    begin
      find_pokemon
      if @pokemon
        @pokemon.update(pokemon_params)
        render json: @pokemon
      else
        render json: { error: 'Unable to update pokemon'}, status: :bad_request
      end
    rescue ActiveRecord::RecordNotFound
      head :not_found
    end
  end

  def destroy
    begin
      find_pokemon
      if @pokemon
        @pokemon.destroy()
        head :no_content
      else
        render json: { error: 'Unable to  destroy pokemon'}, status: :bad_request
      end
    rescue ActiveRecord::RecordNotFound
      head :not_found
    end
  end

  def load_csv
    # Original csv was found there: https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6
    # Method preserved for history purposes but should not because it isn't restful
      # pokemons = CSV.foreach('resources/pokemon.csv', headers: true).map do |row|                                                                 
      # { 
      #   number: row['Number'].to_i,
      #   name: row['Name'],
      #   type_1: row['Type_1'],
      #   type_2: row['Type_2'],
      #   total: row['Total'].to_i,
      #   hp: row['HP'].to_i,
      #   attack: row['Attack'].to_i,
      #   defense: row['Defense'].to_i,
      #   sp_atk: row['Sp_Atk'].to_i,
      #   sp_def: row['Sp_Def'].to_i,
      #   speed: row['Speed'].to_i,
      #   generation: row['Generation'].to_i,
      #   legendary: (row['Legendary'].eql? 'True')
      # }
      # end
      # Pokemon.insert_all(pokemons)
      # render json: pokemons
      render json: { error: 'This method should not be called anymore' }, status: :bad_request
  end

  def table
    # content_tag(:h1, 'Pokemon table on Rails')
    # content_tag(:p, 'Page number '+:page)
    # render
  end

  private

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params 
    params.require(:pokemon).permit(:number, :name, :type_1, :type_2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
  end
end
