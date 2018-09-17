package co.grandcircus.FinalProject.DemoDay.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Ingredient implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String text;
	@ManyToOne
	private Favorite favorite;
	@ManyToOne
	private MyMeal myMeal;

	public Ingredient () { }
	
	
	
	public Ingredient(String text, MyMeal myMeal) {
		this.text = text;
		this.myMeal = myMeal;
	}



	public Ingredient (String text, Favorite favorite) {
		this.text = text;
		this.favorite = favorite;
	}
	
	public Favorite getFavorite() {
		return favorite;
	}

	public void setFavorite(Favorite favorite) {
		this.favorite = favorite;
	}

	public MyMeal getMyMeal() {
		return myMeal;
	}

	public void setMyMeal(MyMeal myMeal) {
		this.myMeal = myMeal;
	}

	public Ingredient(Long id, String text) {
		super();
		this.id = id;
		this.text = text;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}


	@Override
	public String toString() {
		return "Ingredient [id=" + id + ", text=" + text + "]";
	}
	
}
