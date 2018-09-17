package co.grandcircus.FinalProject.DemoDay.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class MyMeal implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String label;
	private int totalTime;
	private int yield;
	
	@ManyToOne
	private User user;
	
	@OneToMany(mappedBy="myMeal", cascade=CascadeType.REMOVE)
	private Set<Ingredient> ingredient;
	
	private String ingredientLines;
	
	private String image;
	private String mealDate;
	
	public MyMeal() {
		
	}
	
	
	public Set<Ingredient> getIngredient() {
		return ingredient;
	}


	public void setIngredient(Set<Ingredient> ingredient) {
		this.ingredient = ingredient;
	}


	public MyMeal(Long id, String label, int totalTime, int yield, User user, Set<Ingredient> ingredients,
			String image, String mealDate) {
		super();
		this.id = id;
		this.label = label;
		this.totalTime = totalTime;
		this.yield = yield;
		this.user = user;
		this.ingredient = ingredients;
		this.image = image;
		this.mealDate = mealDate;
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
	public int getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}
	public int getYield() {
		return yield;
	}
	public void setYield(int yield) {
		this.yield = yield;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Ingredient> getIngredients() {
		return ingredient;
	}
	public void setIngredients(Set<Ingredient> ingredients) {
		this.ingredient = ingredients;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMealDate() {
		return mealDate;
	}
	public void setMealDate(String mealDate) {
		this.mealDate = mealDate;
	}


	public String getIngredientLines() {
		return ingredientLines;
	}


	public void setIngredientLines(String ingredientLines) {
		this.ingredientLines = ingredientLines;
	}
	
	
}
