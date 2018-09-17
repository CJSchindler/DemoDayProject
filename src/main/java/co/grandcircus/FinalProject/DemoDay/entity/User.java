package co.grandcircus.FinalProject.DemoDay.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="user")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@OneToMany(mappedBy="user")
	private Set<Favorite> favorite;
	
	private String first_name;
	private String last_name;
	private String email;
	private String password;
	
	@OneToMany(mappedBy="user")
	private Set<MyMeal> myMeal;
	
	
	
	public Set<MyMeal> getMyMeal() {
		return myMeal;
	}

	public void setMyMeal(Set<MyMeal> myMeal) {
		this.myMeal = myMeal;
	}

	public Set<Favorite> getFavorite() {
		return favorite;
	}

	public void setFavorite(Set<Favorite> favorite) {
		this.favorite = favorite;
	}

	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String first_name, String last_name, String email, String password) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.password = password;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<MyMeal> getMyMeals() {
		return myMeal;
	}

	public void setMyMeals(Set<MyMeal> myMeals) {
		this.myMeal = myMeals;
	}
	
	
	
}
