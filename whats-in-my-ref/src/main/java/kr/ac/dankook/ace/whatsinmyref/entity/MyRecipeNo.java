package kr.ac.dankook.ace.whatsinmyref.entity;

import java.io.Serializable;

public class MyRecipeNo implements Serializable {

    private int user;
    private int recipe;

    public MyRecipeNo(){};
    public MyRecipeNo(int user, int recipe){
        super();
        this.user = user;
        this.recipe = recipe;
    }
}
