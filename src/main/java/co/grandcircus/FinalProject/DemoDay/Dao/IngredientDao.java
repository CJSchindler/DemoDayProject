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
	
	//This may work to get the mymeal ingredients. Or might have to just do the above
	//for my meal too then add both lists to shopping art jsp
	
	public List<Ingredient> findAllByUser_2(User user) {
		return em.createQuery("FROM Ingredient as i WHERE i.favorite.user.id = :userId OR i.myMeal.user.id = :userId2", Ingredient.class)
				.setParameter("userId", user.getId())
				.setParameter("userId2", user.getId())
				.getResultList();
	}

	public void delete(Long id) {
		Ingredient ingredient = em.getReference(Ingredient.class, id); 
		em.remove(ingredient);
		
	}

	public Ingredient findById(Long id) {
		return em.find(Ingredient.class, id);
	}

//	public List<Ingredient> findAllById(List<Long> id) {
//		for (Long ingrId : id) {
//			em.find(Ingredient.class, ingrId);
//		}
//		return null;
//	}
	
//	public void deleteAll(Long id) {
//		em.createQuery("FROM Ingredient WHERE favorite_id = :favorite_id");
//		
//	}
}
