package co.grandcircus.FinalProject.DemoDay;

import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.grandcircus.FinalProject.DemoDay.dao.MenuItemDao;
import co.grandcircus.FinalProject.DemoDay.dao.UserDao;
import co.grandcircus.FinalProject.DemoDay.entity.Favorite;
import co.grandcircus.FinalProject.DemoDay.entity.Recipe;
import co.grandcircus.FinalProject.DemoDay.entity.Result;
import co.grandcircus.FinalProject.DemoDay.entity.User;

@Controller
public class RecipeController {

	@Autowired
	private MenuItemDao menuItemDao;

	@Autowired
	private UserDao userDao;

	@RequestMapping("/")
	public ModelAndView showIndex() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}

	// display the registration page
	@RequestMapping("/register")
	public ModelAndView showRegistration() {
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}

	// After user enters information
	@PostMapping("/register")
	public ModelAndView showRegistration(@RequestParam("first_name") String first_name,
			@RequestParam("last_name") String last_name, @RequestParam("password") String password,
			@RequestParam("email") String email, @RequestParam("password2") String password2) {
	
		String passwordTest;
        
        if (password.matches(password2)) {
            
            passwordTest = "";
            
            User user = new User();
    		user.setFirst_name(first_name);
    		user.setLast_name(last_name);
    		user.setPassword(password);
    		user.setEmail(email);
            
            userDao.create(user);
            return new ModelAndView("redirect:/login");
            
        }
        
        else {
            passwordTest = "Passwords entered do not match. Please try again.";
            ModelAndView mav = new ModelAndView("register");
            mav.addObject("email", email);
            mav.addObject("first_name", first_name);
            mav.addObject("last_name", last_name);
            mav.addObject("passwordTest", passwordTest);
            return mav;
        }
	}

	//shows empty search box
	@RequestMapping("/display")
	public ModelAndView showSearch() {
		ModelAndView mav = new ModelAndView("display");
		return mav;
	}
	
	// calls API to search using user's keyword and time availability
	@RequestMapping("/display/search")
	public ModelAndView showList(@RequestParam(value = "keyword", required = false) String keyword) {
		ModelAndView mav = new ModelAndView("display");

		RestTemplate restTemplate = new RestTemplate();

		int maxTotalTime = 10;

		String url = "https://api.edamam.com/search?q=" + keyword + "&app_id=328dd333"
				+ "&app_key=2925530f7873bcd09aa1376f5114f08d"
				+ "&from=0&to=10" // optional: limits number of results
				+ "&time=1-" + maxTotalTime; // total time is between 1 and maxTotalTime

		// call to API
		ResponseEntity<Result> response = restTemplate.exchange(url, HttpMethod.GET, new HttpEntity<>(null),
				Result.class);

		// extract results from API response
		Result result = response.getBody();

		// extract recipes from results, label as "recipelist" for use in jsp
		mav.addObject("recipelist", result.getHits());

		return mav;
	}

	@RequestMapping("/calendar")
	public ModelAndView showCalendar() {
		ModelAndView mav = new ModelAndView("calendar");
		return mav;
	}

	// user adds recipe to database
	@PostMapping("/add-to-menu")
	public ModelAndView addRecipeToMenu(@RequestParam("label") String label) {

		System.out.println(label);
		// construct a new favorite from the URL params
		Favorite favorite = new Favorite();
		favorite.setLabel(label);
		// FIXME: put more variables here
		menuItemDao.create(favorite);
		ModelAndView mav = new ModelAndView("display");
		mav.addObject("favorite", favorite);
		return mav;
	}

	@RequestMapping("/login")
	public ModelAndView showLoginForm() {
		return new ModelAndView("login-form");
	}

	@PostMapping("/login")
	// get the username and password from the form when it's submitted.
	public ModelAndView submitLoginForm(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes redir) {
		// Find the matching user.
		User user = userDao.findByEmail(email);
		if (user == null || !password.equals(user.getPassword())) {
			// If the user or password don't match, display an error message.
			ModelAndView mav = new ModelAndView("login");
			mav.addObject("message", "Incorrect username or password.");
			return mav;
		}

		// On successful login, add the user to the session.
		session.setAttribute("user", user);

		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Logged in.");
		return new ModelAndView("redirect:/display");
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes redir) {
		// invalidate clears the current user session and starts a new one.
		session.invalidate();

		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Logged out.");
		return new ModelAndView("redirect:/");
	}
}
