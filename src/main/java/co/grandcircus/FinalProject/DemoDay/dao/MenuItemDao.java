//package co.grandcircus.FinalProject.DemoDay.dao;
//
//import javax.persistence.EntityManager;
//import javax.persistence.PersistenceContext;
//import javax.transaction.Transactional;
//
//import org.springframework.stereotype.Repository;
//
//@Repository
//@Transactional
//public class MenuItemDao {
//	
//
//	@PersistenceContext
//	private EntityManager em;
//
//}
////	
////	public void create(Recipe recipe) {
////		em.persist(recipe);
////	}
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
