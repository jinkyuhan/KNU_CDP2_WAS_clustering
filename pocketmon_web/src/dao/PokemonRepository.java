package dao;

import dto.Pokemon;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class PokemonRepository {
    ArrayList<Pokemon> pokemons = new ArrayList<Pokemon>();
    private static PokemonRepository instance;

    public PokemonRepository(){
        pokemons.add(new Pokemon(1, "망나뇽", "드래곤, 비행", "화내기"));
        pokemons.add(new Pokemon(2, "피카츄", "설치류, 번개", "백만 볼트"));
        pokemons.add(new Pokemon(3, "한지우", "인간, 비행청소년", "인성질"));
    }
    public static PokemonRepository getInstance(){
        if (instance == null){
            instance = new PokemonRepository();
        }
        return instance;
    }

    public ArrayList<Pokemon> getAllPokemon() {
        return pokemons;
    }

    public Pokemon getPokemonById(int id) {
        for(int i = 0; i < pokemons.size() ;i++){
            Pokemon pokemon = pokemons.get(i);
            if (pokemon.getId() == id){
                return pokemon;
            }
        }
        return null;
    }

    public void addPokemon(Pokemon pokemon) {
        pokemons.add(pokemon);
    }
    public Pokemon removePokemonById(int id) {
        for(int i = 0; i < pokemons.size() ;i++){
            Pokemon pokemon = pokemons.get(i);
            if (pokemon.getId() == id){
                return pokemons.remove(i);
            }
        }
        return null;
    }

}
