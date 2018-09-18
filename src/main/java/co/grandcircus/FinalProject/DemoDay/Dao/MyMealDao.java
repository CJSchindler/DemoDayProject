package co.grandcircus.FinalProject.DemoDay.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.DemoDay.entity.MyMeal;
import co.grandcircus.FinalProject.DemoDay.entity.User;

@Repository
@Transactional
public class MyMealDao {

	@PersistenceContext
	private EntityManager em;
	
	public List<MyMeal> findAll() {
		return em.createQuery("FROM MyMeal", MyMeal.class).getResultList();
	}
	
	public List<MyMeal> findByUser(User user) {
		return em.createQuery("FROM MyMeal WHERE user = :user AND meal_date = null", MyMeal.class)
				.setParameter("user", user)
				.getResultList();
	}
	
	public MyMeal findByUserByDate(User user, String meal_date) {
		try {
		return em.createQuery("FROM MyMeal WHERE user = :user AND meal_date = :meal_date", MyMeal.class)
				.setParameter("user", user)
				.setParameter("meal_date", meal_date)
				.getSingleResult();
		} catch(Exception ex) {
			return null;
		}
	}
	public void create(MyMeal favorite) {
		em.persist(favorite);
	}
	
	public void delete(Long id) {
		// Deleting with Hibernate entity manager requires fetching a reference first.
		MyMeal favorite = em.getReference(MyMeal.class, id); //just reference, not pulling from DB
		em.remove(favorite);
	}
	
	public MyMeal findByLabel(String label) {
		// HQL queries can have named parameters, such as :regex here.
		return em.createQuery("FROM MyMeal WHERE label = :label", MyMeal.class)
				.setParameter("label", label)
				.getSingleResult();
	}
	
	public MyMeal findByDate(String date) {
		// HQL queries can have named parameters, such as :regex here.
		try {
		return em.createQuery("FROM MyMeal WHERE mealDate = :date", MyMeal.class)
				.setParameter("date", date)
				.getSingleResult();
		} catch (Exception ex) {
			return null;
		}
	
	}
	
	
}
