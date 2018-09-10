package co.grandcircus.FinalProject.DemoDay;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.DemoDay.dao.UserDao;
//import co.grandcircus.FinalProject.DemoDay.dao.MenuItemDao;
//import co.grandcircus.FinalProject.DemoDay.dao.MenuItemDao;
import co.grandcircus.FinalProject.DemoDay.entity.Recipe;
import co.grandcircus.FinalProject.DemoDay.entity.Result;
import co.grandcircus.FinalProject.DemoDay.entity.User;




@Controller
public class RecipeController {
	
//	@Autowired
//	private MenuItemDao menuItemDao;

	// display the initial page that allows users to enter time availability
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/")
	public ModelAndView showIndex() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
	
	//display the search page before user enters keyword
	@RequestMapping("/register")
	public ModelAndView showRegistration() {
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}
	
	// `/madlib-story` matches the URL in the browser
		@PostMapping("/register")
		public ModelAndView showRegistration(@RequestParam("first_name") String first_name, 
				@RequestParam("last_name") String last_name,@RequestParam("password") String password, 
				@RequestParam("email") String email) {

			// Construct a user from the url params
			User user = new User();
			user.setFirst_name(first_name);
			user.setLast_name(last_name);
			user.setPassword(password);
			user.setEmail(email);
			System.out.println(first_name);
			System.out.println(last_name);
			System.out.println(password);
			System.out.println(email);
			
			userDao.create(user);
			System.out.println(first_name);
			System.out.println(last_name);
			System.out.println(password);
			System.out.println(email);
			
			ModelAndView mav = new ModelAndView("display");
			mav.addObject("user", user);

			return mav;

		}
	
	@RequestMapping("/display")
	public ModelAndView showSearch() {
		ModelAndView mav = new ModelAndView("display");
		return mav;
	}
	
	// calls API to search using user's keyword and time availability
	@RequestMapping("/display/search")
	public ModelAndView showList(
			@RequestParam(value="keyword", required=false) String keyword) {
		ModelAndView mav = new ModelAndView("display");
		
		RestTemplate restTemplate = new RestTemplate();
		
		int maxTotalTime = 10;
		
		String url = "https://api.edamam.com/search?q=" + keyword  
				+ "&app_id=328dd333"
				+ "&app_key=2925530f7873bcd09aa1376f5114f08d"
				+ "&from=0&to=10" //optional: limits number of results
				+ "&time=1-" + maxTotalTime; //total time is between 1 and maxTotalTime
		
		// call to API
		ResponseEntity<Result> response = restTemplate.exchange(
		      url, HttpMethod.GET, new HttpEntity<>(null),Result.class);
		
		//extract results from API response
		Result result = response.getBody();
		
		//extract recipes from results, label as "recipelist" for use in jsp
		mav.addObject("recipelist", result.getHits());
		
		return mav;
	}
	
	//user adds recipe to database
	@RequestMapping(value="/add-to-menu", method=RequestMethod.POST)
	public ModelAndView addRecipeToMenu(
			@RequestParam("url") String url,
			@RequestParam("label") String label,
			@RequestParam("image") String image,
			@RequestParam("yield") String yield,
			@RequestParam("ingredientLines") String ingredientLines, 
			@RequestParam("totalTime") String totalTime) {
		
		//construct a new menu item from the URL params
		Recipe recipe = new Recipe();
		
//		menuItemDao.create(recipe);
		ModelAndView mav = new ModelAndView("display");
//		mav.addObject("menuItem", menuItem);
		return mav;
	}
}
