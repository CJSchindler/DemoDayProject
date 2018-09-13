package co.grandcircus.FinalProject.DemoDay.dao;

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
}
