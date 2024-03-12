package com.example.jspdemo.controller;

import com.example.jspdemo.model.Anime;
import com.example.jspdemo.service.AnimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AnimeController {

    @Autowired
    AnimeService animeService;
    
    @GetMapping({"/", "/animeList"})
    public String viewAnimeList(@ModelAttribute("message") String message, Model model){
    
        model.addAttribute("animeList", animeService.getAllAnime());
        model.addAttribute("message", message);
    
        return "ViewAnimeList";
    }

    @GetMapping( "/addAnime")
    public String addAnime(@ModelAttribute("message") String message, Model model){
        model.addAttribute("anime", new Anime());
        model.addAttribute("message", message);
        return "addAnime";
    }
    
    @PostMapping("/saveAnime")
    public String saveAnime(Anime anime, RedirectAttributes redirectAttributes){
        if(animeService.saveOrUpdate(anime)){
            redirectAttributes.addFlashAttribute("message", "Anime was successfully created");
            return "redirect:/viewAnimeList";
        }
        
        redirectAttributes.addFlashAttribute("message", "Unable to create anime");
        return "redirect:/addAnime";
    }
    
    
    @GetMapping("/editAnime/{id}")
    public String editAnimr(@PathVariable Long id, Model model){
        model.addAttribute("anime", animeService.getAnimrById(id));
        
        return "editAnime";
    }

    @PostMapping("/editSaveAnime")
    public String editSaveAnime(Anime anime, RedirectAttributes redirectAttributes){
        if(animeService.saveOrUpdate(anime)){
            redirectAttributes.addFlashAttribute("message", "Anime was successfully updated");
            return "redirect:/viewAnimeList";
        }

        redirectAttributes.addFlashAttribute("message", "Unable to update anime");
        return "redirect:/addAnime/" + anime.getId();
    }
    
    @GetMapping("/deleteAnimr/{id}")
    public String deleteAnime(@PathVariable Long id, RedirectAttributes redirectAttributes){
        if(animeService.deleteAnime(id)){
            redirectAttributes.addFlashAttribute("message", "Anime was successfully deleted");
        }

        redirectAttributes.addFlashAttribute("message", "Unable to delete anime");
        return "redirect:/viewAnimeList";
    }
}
