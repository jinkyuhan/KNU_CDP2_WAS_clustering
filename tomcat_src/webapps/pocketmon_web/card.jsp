<%@ page import="dao.PokemonRepository" %>
<%@ page import="dto.Pokemon" %>
<%@ page import="java.util.ArrayList" %>
<div class="container">
    <div class="row">
        <%
            PokemonRepository pokeRepo = PokemonRepository.getInstance();
            ArrayList<Pokemon> freePokemons = pokeRepo.getAllPokemon();
            String rowStartTag = "<div class=\"row\">";
            String rowEndTag = "</div>";
            for (int i = 0; i < freePokemons.size(); i++) {
                if (i % 4 == 0 && i > 0 && i < freePokemons.size() - 1) {
                    out.println(rowEndTag);
                    out.println(rowStartTag);
                }
                Pokemon pokemon = freePokemons.get(i);
        %>
        <div class="col-3">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1563725911583-7d108f720483" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%=pokemon.getName()%>
                    </h5>
                    <p class="card-text">타입:<%=pokemon.getType()%>
                    </p>
                    <p class="card-text">특기:<%=pokemon.getSkill()%>
                    </p>
                    <a href="#" class="btn btn-primary">포획하기</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div> 
