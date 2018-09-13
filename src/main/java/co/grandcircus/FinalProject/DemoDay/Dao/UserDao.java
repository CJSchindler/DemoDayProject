package co.grandcircus.FinalProject.DemoDay.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.DemoDay.entity.User;

import java.util.List;

@Repository
@Transactional
public class UserDao {

	@PersistenceContext
	private EntityManager em;

	public List<User> findAll() {
		return em.createQuery("FROM User", User.class).getResultList();
	}

	public User findByID(Long id) {
		return em.find(User.class, id);
	}

	public User findByEmail(String email) {
		try {
			return em.createQuery("FROM User WHERE email = :email", User.class).setParameter("email", email)
					.getSingleResult();
		} catch (Exception ex) {
			return null;
		}
	}

	public void create(User user) {
		em.persist(user);
	}

	public void delete(Long id) {
		User user = em.getReference(User.class, id);
		em.remove(user);
	}

	public void update(User user) {
		em.merge(user);

	}

}
