# README

Small REST API to play around with Ruby on Rails. 💎

Pokemon database taken from https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6

## Setting up

On a system with a working Rails installation:

* Get the code from git.
* In the project folder, run `bundle install` to get the dependencies.
* Run `rails s` to start the server.
* On a browser, go to `http://localhost:3000/pokemons/visual/table/1` to see the table.

In a tool like Postman or Insomnia, you can access the following endpoints:
* `GET localhost:3000/pokemons` Lists all the pokemon.
* `GET localhost:3000/pokemons/*id*` Gets the pokemon with the given id.
* `POST localhost:3000/pokemons` Creates a new pokemon with the data given in the request body as Json (check below for an example).
* `PUT localhost:3000/pokemons/*id*` Updates the pokemon with the given id with the new field values in the request body.
* `DELETE localhost:3000/pokemons/*id*` Destroys the selected pokemon and removes it from the database.

Here is an example of a pokemon object that can be created:

```
{
    "number":"999",
    "name":"testmon",
    "type_1":"poison",
    "type_2":"grass",
    "total":"1234",
    "hp":"1",
    "attack":"2",
    "defense":"3",
    "sp_atk":"4",
    "sp_def":"5",
    "speed":"6",
    "generation":"13",
    "legendary":"false"
}
```