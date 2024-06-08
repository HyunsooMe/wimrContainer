package kr.ac.dankook.ace.whatsinmyref.entity;

import java.io.Serializable;

public class ScrapNo implements Serializable {

    private int user;
    private int recipe;

    public ScrapNo(){}
    public ScrapNo(int user, int recipe){
        super();
        this.user = user;
        this.recipe =recipe;
    }
}
