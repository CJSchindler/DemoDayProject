package co.grandcircus.FinalProject.DemoDay.dao;


import java.util.List;

import javax.persistence.EntityManager;

import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.DemoDay.entity.Favorite;
import co.grandcircus.FinalProject.DemoDay.entity.User;

@Repository
@Transactional
public class MenuItemDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public List<Favorite> findAll() {
		return em.createQuery("FROM Favorite", Favorite.class).getResultList();
	}
	public List<Favorite> findByUser(User user) {
		return em.createQuery("FROM Favorite WHERE user = :user", Favorite.class)
				.setParameter("user", user)
				.getResultList();
	}
	public void create(Favorite favorite) {
		em.persist(favorite);
	}
	
	public void delete(Integer id) {
		// Deleting with Hibernate entity manager requires fetching a reference first.
		Favorite favorite = em.getReference(Favorite.class, id); //just reference, not pulling from DB
		em.remove(favorite);
	}
	
	public Favorite findByLabel(String label) {
		// HQL queries can have named parameters, such as :regex here.
		return em.createQuery("FROM Favorite WHERE label = :label", Favorite.class)
				.setParameter("label", label)
				.getSingleResult();
	}
	
	public Favorite findByDate(String date) {
		// HQL queries can have named parameters, such as :regex here.
		try {
		return em.createQuery("FROM Favorite WHERE mealDate = :date", Favorite.class)
				.setParameter("date", date)
				.getSingleResult();
		} catch (Exception ex) {
			return null;
		}
	
	}
	
	
}
