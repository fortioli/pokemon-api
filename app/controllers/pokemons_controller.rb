class PokemonsController < ApplicationController
  
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
        render json: { error: 'Unable to get pokemon'}, status: 400
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
        render json: { error: 'Unable to update pokemon'}, status: 400
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
        render json: { error: 'Unable to  destroy pokemon'}, status: 400
      end
    rescue ActiveRecord::RecordNotFound
      head :not_found
    end
  end

  private

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params 
    params.require(:pokemon).permit(:number, :name, :type_1, :type_2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
  end
end
