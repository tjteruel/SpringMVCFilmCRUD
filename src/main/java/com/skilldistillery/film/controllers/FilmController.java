package com.skilldistillery.film.controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.FilmDAO;
import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {
	
	@Autowired
	private FilmDAO filmDao;
	
	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false";
	
	@RequestMapping(path="addForm.do", method=RequestMethod.GET)
	public ModelAndView addForm() {
		Film u = new Film();
		ModelAndView mv = new ModelAndView("WEB-INF/views/add.jsp", "film", u);
		return mv;
	}

	
	//returns FILM by ID
	@RequestMapping (path="display.do", method=RequestMethod.GET)
		public ModelAndView findFilmById(int filmId) {
		ModelAndView mv = new ModelAndView();
		Film film = null;
		String user = "student";
		String pass = "student";
		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {

			String sql = "SELECT * FROM film WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, filmId);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				film = new Film();
				film.setTitle(rs.getString("title"));
				film.setReleaseYear(rs.getInt("release_year"));
				film.setRating(rs.getString("rating"));
				film.setDescription(rs.getString("description"));
				film.setId(rs.getInt("id"));
				film.setLanguageId(rs.getInt("language_id"));
				film.setRating(rs.getString("rating"));
				film.setReleaseYear(rs.getInt("release_year"));
				film.setRentalDuration(rs.getInt("rental_duration"));
				film.setRentalRate(rs.getDouble("rental_rate"));
				film.setReplacementCost(rs.getDouble("replacement_cost"));
				film.setSpecialFeatures(rs.getString("special_features"));
				film.setActors(findActorsByFilmId(filmId));
				film.setLanguage(findLanguageById(filmId));
			}
			rs.close();
			pst.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (film == null) {
			mv.setViewName("WEB-INF/views/filmNotFound.jsp");
			return mv;
		}
		else {			
			mv.addObject("film", film);
			mv.setViewName("WEB-INF/views/display.jsp");
			return mv;
		}
	}
	
	//user adds FILM
	@RequestMapping (path="addNewFilm.do", method=RequestMethod.POST)
	public ModelAndView addFilm(Film film) {
		ModelAndView mv = new ModelAndView();
		String user = "student";
		String pass = "student";
		  Connection conn = null;
		  try {
		    conn = DriverManager.getConnection(URL, user, pass);
		    conn.setAutoCommit(false); // START TRANSACTION
		    String sql = "INSERT into film (title, description, release_year, rating, language_id) VALUES (?, ?, ?, ?, 1)";
		    PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		    stmt.setString(1, film.getTitle());
		    stmt.setString(2, film.getDescription());
		    stmt.setInt(3, film.getReleaseYear());
		    stmt.setString(4, film.getRating());
		    int updateCount = stmt.executeUpdate();    
		    if (updateCount == 1) {
		        ResultSet keys = stmt.getGeneratedKeys();
		        if (keys.next()) {
		          int newFilmId = keys.getInt(1);
		          film.setId(newFilmId);
//		          if (film.getActors() != null && film.getActors().size() > 0) {
//		            sql = "INSERT INTO film_actor (film_id, actor_id) VALUES (?,?)";
//		            stmt = conn.prepareStatement(sql);
//		            for (Actor actors : film.getActors()) {
//		              stmt.setInt(1, film.getId());
//		              stmt.setInt(2, newFilmId);
//		              updateCount = stmt.executeUpdate();
		            }
//		          }
//		        }
//		      } else {
//		        film = null;
		      }
		      conn.commit();           // COMMIT TRANSACTION
		  } catch (SQLException sqle) {
			    sqle.printStackTrace();
			    if (conn != null) {
			      try { conn.rollback(); }
			      catch (SQLException sqle2) {
			        System.err.println("Error trying to rollback");
			      }
			    }
			    throw new RuntimeException("Error inserting film " + film);
			  }
			mv.addObject("film", film);
			mv.setViewName("WEB-INF/views/filmAdded.jsp");
			return mv;
			}
	
	//deletes FILM by FILM ID
	@RequestMapping("filmDelete.do")
	public String deleteFilm(@RequestParam("Delete") int filmId) {
		if (filmDao.deleteFilm(filmId)) {
			return "/WEB-INF/views/filmDeleted.jsp";
		} else {
			return "/WEB-INF/views/Error.jsp";
		}
	}
	
	
	@RequestMapping(path="updateForm.do", method=RequestMethod.GET)
	public ModelAndView updateForm() {
		Film u = new Film();
		ModelAndView mv = new ModelAndView("WEB-INF/views/filmUpdate.jsp", "film", u);
		return mv;
	}
	//
	@RequestMapping("updateFilm.do")
	public String updateFilm(@RequestParam("Update") Film film) {
		if (filmDao.updateFilm(film)) {
			return "/WEB-INF/views/updateSuccess.jsp";
		} else {
			return "/WEB-INF/views/updateFail.jsp";
		}
	}
	
	//returns ACTORs by FILM ID
	public List<Actor> findActorsByFilmId(int filmId) {
		List<Actor> actors = new ArrayList();
		String user = "student";
		String pass = "student";
		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {
			String sql = "SELECT * FROM actor JOIN film_actor ON actor.id = film_actor.actor_id join film on film_actor.film_id = film.id where film.id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, filmId);
			ResultSet rs = pst.executeQuery();
			Actor actor = null;
			while (rs.next()) {
				actor = new Actor();
				actor.setId(rs.getInt("id"));
				actor.setFirstName(rs.getString("first_name"));
				actor.setLastName(rs.getString("last_name"));
				actors.add(actor);
			}
			rs.close();
			pst.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return actors;
	}
	
	
	//returns LANGUAGE by ID
	public String findLanguageById(int filmId) {
		String user = "student";
		String pass = "student";
		String languageName = "";
		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {
			String sql = "SELECT language.name FROM film JOIN language ON film.language_id = language.id WHERE film.id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, filmId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				languageName = rs.getString("language.name");
			}
			rs.close();
			pst.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return languageName;
	}
}
