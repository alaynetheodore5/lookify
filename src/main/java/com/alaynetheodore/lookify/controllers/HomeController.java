package com.alaynetheodore.lookify.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alaynetheodore.lookify.models.Song;
import com.alaynetheodore.lookify.services.SongService;


@Controller
public class HomeController {

	private final SongService songService;
	
	public HomeController(SongService songService) {
		this.songService = songService;
	}
    @RequestMapping("/")
    public String index(Model model, HttpServletRequest request) {
    	String q = request.getParameter("q");
    	System.out.println(q);
    	if( q == null) {
    		model.addAttribute("all", songService.getAll());			
		} else {
			model.addAttribute("all", songService.search(q));	
    	}
    	model.addAttribute("song", new Song());
    	return "index.jsp";
    }
    
    @RequestMapping("/topten")
    public String topTen(Model model) {
    	model.addAttribute("topTen", songService.getTopTen());	
    	return "topten.jsp";
    }
    
    @RequestMapping(value="/songs", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("song") Song song, BindingResult result, Model model) {
		if(result.hasErrors()) {
			// display error messages
			model.addAttribute("all", songService.getAll());
			return "index.jsp";
		} else {			
			songService.create(song);
		}
		return "redirect:/";
	}
    
	@RequestMapping("/songs/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		model.addAttribute("song", songService.getOne(id));
		return "edit.jsp";
	}
	
	@RequestMapping(value="/songs/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("song") Song song, BindingResult result, @PathVariable("id") Long id) {
		if(result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "edit.jsp";
		} else {			
			songService.update(song, id);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/songs/{id}/remove")
	public String remove(@PathVariable("id") Long id) {
		songService.remove(id);
		return "redirect:/";
	}
	
	@RequestMapping("/songs/{id}/show")
	public String show(@PathVariable("id") Long id, Model model) {
		model.addAttribute("song", songService.getOne(id));
		return "show.jsp";
	}
}

