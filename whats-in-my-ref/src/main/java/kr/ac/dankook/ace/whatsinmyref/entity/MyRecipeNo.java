package kr.ac.dankook.ace.whatsinmyref.entity;

import java.io.Serializable;

public class MyRecipeNo implements Serializable {

    private int user;
    private int personalRecipe;

    public MyRecipeNo(){};
    public MyRecipeNo(int user, int personalRecipe){
        super();
        this.user = user;
        this.personalRecipe = personalRecipe;
    }
}
