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
	
	public void create(Favorite favorite) {
		em.persist(favorite);
	}
}
//////	
//////	public void delete(Integer id) {
//////		// Deleting with Hibernate entity manager requires fetching a reference first.
//////		Item item = em.getReference(Item.class, id); //just reference, not pulling from DB
//////		em.remove(item);
//////	}
//////	
//////	public List<Item> findByKeyword(String keyword) {
//////		// HQL queries can have named parameters, such as :regex here.
//////		return em.createQuery("FROM items WHERE LOWER(name) LIKE :regex", Item.class)
//////				.setParameter("regex", "%" + keyword.toLowerCase() + "%")
//////				.getResultList();
////}
