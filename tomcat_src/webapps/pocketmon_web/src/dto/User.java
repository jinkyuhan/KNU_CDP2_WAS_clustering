package dto;

import dao.PokemonRepository;

import java.util.ArrayList;

public class User {
    private String userId;
    private String userPw;
    private ArrayList<Pokemon> myPokemons;

    public User(String id, String pw) {
        this.userId = id;
        this.userPw = pw;
        this.myPokemons = new ArrayList<Pokemon>();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public ArrayList<Pokemon> getAllPokemons() {
        return myPokemons;
    }

    public void catchPokemon(int id){
        PokemonRepository pokeRepo = PokemonRepository.getInstance();
        myPokemons.add(pokeRepo.removePokemonById(id));
    }

    public void releasePokemonById(int id){
        PokemonRepository pokeRepo = PokemonRepository.getInstance();
        for(int i=0; i < myPokemons.size(); i++ ){
            if (myPokemons.get(i).getId() == id){
                pokeRepo.addPokemon(myPokemons.remove(i));
            }
        }
    }
}
