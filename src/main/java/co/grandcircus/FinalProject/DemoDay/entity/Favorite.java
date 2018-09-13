package co.grandcircus.FinalProject.DemoDay.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="favorite")
public class Favorite {

	
	@ManyToOne
	User user;
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String label;
	private String url;
	private String rating;
	private String mealDate;
	private String image;
	private String ingredientLines;
	
	
	public Favorite() {
		
	}

	public Favorite(Long id, String label, String url, String rating, String mealDate, String image) {
		super();
		this.id = id;
		this.label = label;
		this.url = url;
		this.rating = rating;
		this.mealDate = mealDate;
		this.image = image;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getLabel() {
		return label;
	}


	public void setLabel(String label) {
		this.label = label;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getRating() {
		return rating;
	}


	public void setRating(String rating) {
		this.rating = rating;
	}


	public String getMealDate() {
		return mealDate;
	}


	public void setMealDate(String mealDate) {
		this.mealDate = mealDate;
	}


	public String getImage() {
		return image;
	}


	public String getIngredientLines() {
		return ingredientLines;
	}

	public void setIngredientLines(String ingredientLines) {
		this.ingredientLines = ingredientLines;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
	
	
}
