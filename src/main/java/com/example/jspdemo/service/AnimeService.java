package com.example.jspdemo.service;

import com.example.jspdemo.model.Anime;
import com.example.jspdemo.repository.AnimeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AnimeService {


    @Autowired
    AnimeRepository animeRepository;
    
    public List<Anime> getAllAnime(){
        List<Anime> animes = new ArrayList<>();
        animeRepository.findAll().forEach(anime -> animes.add(anime));
        
        return animes;
    }
    
    public Anime getAnimrById(Long id)
    {
        return animeRepository.findById(id).get();
    }
    
    public boolean saveOrUpdate(Anime anime){
        Anime animeToUpdate = animeRepository.save(anime);
        
        if (animeRepository.findById(animeToUpdate.getId()) != null){
            return true;
        }
        return false;
    }
    public boolean deleteAnime(Long id){
        animeRepository.deleteById(id);

        if (animeRepository.findById(id) == null){
            return true;
        }
        return false;
        
    }
}
