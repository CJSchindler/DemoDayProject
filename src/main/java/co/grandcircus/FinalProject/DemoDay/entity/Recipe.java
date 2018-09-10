package co.grandcircus.FinalProject.DemoDay.entity;

import java.util.List;

//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Table;

//@Entity
//@Table(name="user_recipe")
public class Recipe {

//	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String label;
	private String image;
	private String url;
	private int yield;
	List <String> ingredientLines;
	private int totalTime;

	public Recipe() {
		super();
	}

	
	public Recipe(Long id, String label, String image, String url, int yield, List<String> ingredientLines,
			int totalTime) {
		super();
		this.id = id;
		this.label = label;
		this.image = image;
		this.url = url;
		this.yield = yield;
		this.ingredientLines = ingredientLines;
		this.totalTime = totalTime;
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


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public int getYield() {
		return yield;
	}


	public void setYield(int yield) {
		this.yield = yield;
	}


	public List<String> getIngredientLines() {
		return ingredientLines;
	}


	public void setIngredientLines(List<String> ingredientLines) {
		this.ingredientLines = ingredientLines;
	}


	public int getTotalTime() {
		return totalTime;
	}


	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	
	
	
}
