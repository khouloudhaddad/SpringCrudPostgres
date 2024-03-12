package com.example.jspdemo.model;

import javax.persistence.*;

@Entity
@Table(name="Anime")
public class Anime {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Column
    private String name;
    
    @Column
    private int creation_year;

    public Anime() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCreation_year() {
        return creation_year;
    }

    public void setCreation_year(int creation_year) {
        this.creation_year = creation_year;
    }
}
