package kr.ac.dankook.ace.whatsinmyref.entity;

import java.io.Serializable;

public class ScrapId implements Serializable {

    private int user;
    private int recipe;

    public ScrapId(){}
    public ScrapId(int user, int recipe){
        super();
        this.user = user;
        this.recipe = recipe;
    }
}
