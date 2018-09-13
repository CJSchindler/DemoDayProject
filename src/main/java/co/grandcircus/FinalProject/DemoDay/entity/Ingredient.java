package co.grandcircus.FinalProject.DemoDay.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Ingredient {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String text;
	@ManyToOne
	private Favorite favorite;

	public Ingredient () { }
	
	public Ingredient (String text, Favorite favorite) {
		this.text = text;
		this.favorite = favorite;
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
}
