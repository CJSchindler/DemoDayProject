package co.grandcircus.FinalProject.DemoDay.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.DemoDay.entity.Favorite;
import co.grandcircus.FinalProject.DemoDay.entity.Ingredient;
import co.grandcircus.FinalProject.DemoDay.entity.User;

@Repository
@Transactional
public class IngredientDao {

	@PersistenceContext
	private EntityManager em;
	
	public void create(Ingredient ingredient) {
		em.persist(ingredient);
	}
	
	public List<Ingredient> findAll() {
		return em.createQuery("FROM Ingredient", Ingredient.class).getResultList();
	}
	
	public List<Ingredient> findAllByUser(User user) {
		return em.createQuery("FROM Ingredient as i WHERE i.favorite.user.id = :userId", Ingredient.class)
				.setParameter("userId", user.getId())
				.getResultList();
	}

	public void delete(Long id) {
		Ingredient ingredient = em.getReference(Ingredient.class, id); 
		em.remove(ingredient);
		
	}
	
//	public void deleteAll(Long id) {
//		em.createQuery("FROM Ingredient WHERE favorite_id = :favorite_id");
//		
//	}
}
