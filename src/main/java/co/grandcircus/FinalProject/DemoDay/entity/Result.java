package co.grandcircus.FinalProject.DemoDay.entity;

import java.util.List;

public class Result {

	private List<RecipeShell> hits;

	public Result() {
		super();
	}

	public Result(List<RecipeShell> hits) {
		super();
		this.hits = hits;
	}

	public List<RecipeShell> getHits() {
		return hits;
	}

	public void setHits(List<RecipeShell> hits) {
		this.hits = hits;
	}
	
	
}
