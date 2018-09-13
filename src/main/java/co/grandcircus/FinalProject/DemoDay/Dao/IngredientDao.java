package co.grandcircus.FinalProject.DemoDay.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.DemoDay.entity.Ingredient;

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

	public void delete(Long id) {
		Ingredient ingredient = em.getReference(Ingredient.class, id); 
		em.remove(ingredient);
		
	}
}
