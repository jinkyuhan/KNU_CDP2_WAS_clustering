package dto;

public class Pokemon {

    private int id;
    private String name;
    private String type;
    private String skill;

    public Pokemon(int id, String name, String type, String skill) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.skill = skill;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }
}
