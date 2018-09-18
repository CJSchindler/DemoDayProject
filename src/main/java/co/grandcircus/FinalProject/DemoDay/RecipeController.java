package co.grandcircus.FinalProject.DemoDay;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.grandcircus.FinalProject.DemoDay.dao.FavoriteDao;
import co.grandcircus.FinalProject.DemoDay.dao.IngredientDao;
import co.grandcircus.FinalProject.DemoDay.dao.MyMealDao;
import co.grandcircus.FinalProject.DemoDay.dao.UserDao;
import co.grandcircus.FinalProject.DemoDay.entity.Favorite;
import co.grandcircus.FinalProject.DemoDay.entity.Ingredient;
import co.grandcircus.FinalProject.DemoDay.entity.MyMeal;
import co.grandcircus.FinalProject.DemoDay.entity.Result;
import co.grandcircus.FinalProject.DemoDay.entity.User;

@Controller
public class RecipeController {

	@Autowired
	private MyMealDao myMealDao;

	@Autowired
	private FavoriteDao favoriteDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private IngredientDao ingredientDao;

	private LocalDate dateToday;
	
	@Value("${appKey}")
	private String appKey;
	@Value("${appId}")
	private String appId;

	// shows login page
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

	// Adds new user information to database, checks for email address in DB, password verification
	@PostMapping("/register")
	public ModelAndView showRegistration(@RequestParam("first_name") String first_name,
			@RequestParam("last_name") String last_name, @RequestParam("password") String password,
			@RequestParam("email") String email, @RequestParam("password2") String password2,
			RedirectAttributes redir) {

		String passwordTest;
		String duplicateEmail;

		if (userDao.findByEmail(email) != null) {
			duplicateEmail = "This email already exists; please enter a valid email.";
			ModelAndView mav = new ModelAndView("register");
			mav.addObject("first_name", first_name);
			mav.addObject("last_name", last_name);
			mav.addObject("duplicateEmail", duplicateEmail);
			return mav;
		} else {

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
	}

	// display: redirects to correct display for search type
	@RequestMapping("/display/{date}")
	public ModelAndView showSearch(@SessionAttribute("user") User user, @PathVariable("date") String date,
			@RequestParam("time") int time, @RequestParam("searchType") String searchType, RedirectAttributes redir) {

		LocalDate searchDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		DayOfWeek day = searchDate.getDayOfWeek();

		ModelAndView mav;

		if (searchType.equals("favorites")) {
			mav = new ModelAndView("redirect:/display/favorites/" + time + "/" + date + "");
			redir.addAttribute("time", time);
			redir.addAttribute("day", day);
			redir.addAttribute("searchType", searchType);
		}

		else if (searchType.equals("myMeals")) {
			mav = new ModelAndView("redirect:/display/myMeals/" + time + "/" + date + "");
			redir.addAttribute("time", time);
			redir.addAttribute("day", day);
			redir.addAttribute("searchType", searchType);
		}

		else {
			mav = new ModelAndView("display");
			mav.addObject("time", time);
			mav.addObject("day", day);
			mav.addObject("searchType", searchType);
		}

		return mav;
	}

	// NEW search calls API to search using user's keyword and time availability
	// ("/display/{searchType}/{time}/{date}")
	@RequestMapping("/display/new/{time}/{date}")
	public ModelAndView showList(@SessionAttribute("user") User user,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam("searchType") String searchType, 
			@PathVariable("time") int time,
			@PathVariable("date") String date) {

		ModelAndView mav = new ModelAndView("display");
		mav.addObject("searchType", searchType);
		if (keyword != null) {
			mav.addObject("keyword", keyword);
		}
		RestTemplate restTemplate = new RestTemplate();

		String url = "https://api.edamam.com/search?q=" + keyword + "&app_id=" + appId
				+ "&app_key=" + appKey 
				+ "&from=0&to=10" // optional: limits number of results
				+ "&time=1-" + time; // total time is between 1 and maxTotalTime

		// call to API
		ResponseEntity<Result> response = restTemplate.exchange(url, HttpMethod.GET, new HttpEntity<>(null),
				Result.class);

		// extract results from API response
		Result result = response.getBody();

		// extract recipes from results, label as "recipelist" for use in jsp
		mav.addObject("recipelist", result.getHits());
		mav.addObject("date", date);

		return mav;

	}

	// show a list of favorite recipes by user
	@RequestMapping("/display/favorites/{time}/{date}")
	public ModelAndView showFavorites(@SessionAttribute("user") User user, 
			@PathVariable("time") int time, @RequestParam("searchType") String searchType,
			@PathVariable("date") String date) {
		
		ModelAndView mav = new ModelAndView("display");
		mav.addObject("searchType", searchType);

			List<Favorite> favorites = favoriteDao.findByUser(user);
			
			mav.addObject("favorites", favorites);
			mav.addObject("date", date);

		return mav;

	}

	// show list of user entered meals
	@RequestMapping("/display/myMeals/{time}/{date}")
	public ModelAndView showMyMeals(@SessionAttribute("user") User user, @PathVariable("time") int time,
			@RequestParam("searchType") String searchType, @PathVariable("date") String date) {

		ModelAndView mav = new ModelAndView("display");
		mav.addObject("searchType", searchType);

		List<MyMeal> myMeals = myMealDao.findByUser(user);

		mav.addObject("myMeals", myMeals);
		mav.addObject("date", date);
		

		return mav;

	}

	// show calendar beginning on FOLLOWING Sunday, includes meals added
	@RequestMapping("/next-week")
	public ModelAndView showCalendarFuture(@SessionAttribute("user") User user) {
		ModelAndView mav = new ModelAndView("calendar");
		mav.addObject("whichWeek", "future");

		dateToday = LocalDate.now();

		DayOfWeek currentDay = dateToday.getDayOfWeek();

		LocalDate sunday = null;
		LocalDate monday = null;
		LocalDate tuesday = null;
		LocalDate wednesday = null;
		LocalDate thursday = null;
		LocalDate friday = null;
		LocalDate saturday = null;

		switch (currentDay) {
		case SUNDAY:
			sunday = dateToday.plusDays(7);
			monday = dateToday.plusDays(8);
			tuesday = dateToday.plusDays(9);
			wednesday = dateToday.plusDays(10);
			thursday = dateToday.plusDays(11);
			friday = dateToday.plusDays(12);
			saturday = dateToday.plusDays(13);
			break;
		case MONDAY:
			sunday = dateToday.plusDays(6);
			monday = dateToday.plusDays(7);
			tuesday = dateToday.plusDays(8);
			wednesday = dateToday.plusDays(9);
			thursday = dateToday.plusDays(10);
			friday = dateToday.plusDays(11);
			saturday = dateToday.plusDays(12);
			break;
		case TUESDAY:
			sunday = dateToday.plusDays(5);
			monday = dateToday.plusDays(6);
			tuesday = dateToday.plusDays(7);
			wednesday = dateToday.plusDays(8);
			thursday = dateToday.plusDays(9);
			friday = dateToday.plusDays(10);
			saturday = dateToday.plusDays(11);
			break;
		case WEDNESDAY:
			sunday = dateToday.plusDays(4);
			monday = dateToday.plusDays(5);
			tuesday = dateToday.plusDays(6);
			wednesday = dateToday.plusDays(7);
			thursday = dateToday.plusDays(8);
			friday = dateToday.plusDays(9);
			saturday = dateToday.plusDays(10);
			break;
		case THURSDAY:
			sunday = dateToday.plusDays(3);
			monday = dateToday.plusDays(4);
			tuesday = dateToday.plusDays(5);
			wednesday = dateToday.plusDays(6);
			thursday = dateToday.plusDays(7);
			friday = dateToday.plusDays(8);
			saturday = dateToday.plusDays(9);
			break;
		case FRIDAY:
			sunday = dateToday.plusDays(2);
			monday = dateToday.plusDays(3);
			tuesday = dateToday.plusDays(4);
			wednesday = dateToday.plusDays(5);
			thursday = dateToday.plusDays(6);
			friday = dateToday.plusDays(7);
			saturday = dateToday.plusDays(8);
			break;
		case SATURDAY:
			sunday = dateToday.plusDays(1);
			monday = dateToday.plusDays(2);
			tuesday = dateToday.plusDays(3);
			wednesday = dateToday.plusDays(4);
			thursday = dateToday.plusDays(5);
			friday = dateToday.plusDays(6);
			saturday = dateToday.plusDays(7);
			break;
		default:
			break;
		}

		String sundayString = sunday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String mondayString = monday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String tuesdayString = tuesday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String wednesdayString = wednesday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String thursdayString = thursday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String fridayString = friday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String saturdayString = saturday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));

		mav.addObject("sunday", sundayString);
		mav.addObject("monday", mondayString);
		mav.addObject("tuesday", tuesdayString);
		mav.addObject("wednesday", wednesdayString);
		mav.addObject("thursday", thursdayString);
		mav.addObject("friday", fridayString);
		mav.addObject("saturday", saturdayString);

		int progressTime = 0;
		String mealType = "";
		int timePerWeek = 0;

		if (favoriteDao.findByUserByDate(user, sundayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, sundayString).getTotalTime();
			mav.addObject("sundayMeal", favoriteDao.findByUserByDate(user, sundayString));
			mealType = "favorite";
			
		}

		if (favoriteDao.findByUserByDate(user, mondayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, mondayString).getTotalTime();
			mav.addObject("mondayMeal", favoriteDao.findByUserByDate(user, mondayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, tuesdayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, tuesdayString).getTotalTime();
			mav.addObject("tuesdayMeal", favoriteDao.findByUserByDate(user, tuesdayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, wednesdayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, wednesdayString).getTotalTime();
			mav.addObject("wednesdayMeal", favoriteDao.findByUserByDate(user, wednesdayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, thursdayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, thursdayString).getTotalTime();
			mav.addObject("thursdayMeal", favoriteDao.findByUserByDate(user, thursdayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, fridayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, fridayString).getTotalTime();
			mav.addObject("fridayMeal", favoriteDao.findByUserByDate(user, fridayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, saturdayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, saturdayString).getTotalTime();
			mav.addObject("saturdayMeal", favoriteDao.findByUserByDate(user, saturdayString));
			mealType = "favorite";
		}
		
		if (myMealDao.findByUserByDate(user, sundayString) != null) {
			progressTime += 100 / 7;
			mav.addObject("sundayMeal", myMealDao.findByUserByDate(user, sundayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, mondayString) != null) {
			progressTime += 100 / 7;
			mav.addObject("mondayMeal", myMealDao.findByUserByDate(user, mondayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, tuesdayString) != null) {
			progressTime += 100 / 7;
			mav.addObject("tuesdayMeal", myMealDao.findByUserByDate(user, tuesdayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, wednesdayString) != null) {
			progressTime += 100 / 7;
			mav.addObject("wednesdayMeal", myMealDao.findByUserByDate(user, wednesdayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, thursdayString) != null) {
			progressTime += 100 / 7;
			mav.addObject("thursdayMeal", myMealDao.findByUserByDate(user, thursdayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, fridayString) != null) {
			progressTime += 100 / 7;
			mav.addObject("fridayMeal", myMealDao.findByUserByDate(user, fridayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, saturdayString) != null) {
			progressTime += 100 / 7;
			mav.addObject("saturdayMeal", myMealDao.findByUserByDate(user, saturdayString));
			mealType = "myMeal";
		}

		mav.addObject("progressTime", progressTime);
		mav.addObject("mealType", mealType);
		mav.addObject("timePerWeek", timePerWeek);
		return mav;
	}

	// show calendar for CURRENT week, includes any meals added
	@RequestMapping("/calendar")
	public ModelAndView showCalendarCurrent(@SessionAttribute("user") User user) {

		ModelAndView mav = new ModelAndView("calendar");
		mav.addObject("whichWeek", "current");
		dateToday = LocalDate.now();

		DayOfWeek currentDay = dateToday.getDayOfWeek();

		LocalDate sunday = null;
		LocalDate monday = null;
		LocalDate tuesday = null;
		LocalDate wednesday = null;
		LocalDate thursday = null;
		LocalDate friday = null;
		LocalDate saturday = null;

		switch (currentDay) {
		case SUNDAY:
			sunday = dateToday;
			monday = dateToday.plusDays(1);
			tuesday = dateToday.plusDays(2);
			wednesday = dateToday.plusDays(3);
			thursday = dateToday.plusDays(4);
			friday = dateToday.plusDays(5);
			saturday = dateToday.plusDays(6);
			break;
		case MONDAY:
			sunday = dateToday.minusDays(1);
			monday = dateToday;
			tuesday = dateToday.plusDays(1);
			wednesday = dateToday.plusDays(2);
			thursday = dateToday.plusDays(3);
			friday = dateToday.plusDays(4);
			saturday = dateToday.plusDays(5);
			break;
		case TUESDAY:
			sunday = dateToday.minusDays(2);
			monday = dateToday.minusDays(1);
			tuesday = dateToday;
			wednesday = dateToday.plusDays(1);
			thursday = dateToday.plusDays(2);
			friday = dateToday.plusDays(3);
			saturday = dateToday.plusDays(4);
			break;
		case WEDNESDAY:
			sunday = dateToday.minusDays(3);
			monday = dateToday.minusDays(2);
			tuesday = dateToday.minusDays(1);
			wednesday = dateToday;
			thursday = dateToday.plusDays(1);
			friday = dateToday.plusDays(2);
			saturday = dateToday.plusDays(3);
			break;
		case THURSDAY:
			sunday = dateToday.minusDays(4);
			monday = dateToday.minusDays(3);
			tuesday = dateToday.minusDays(2);
			wednesday = dateToday.minusDays(1);
			thursday = dateToday;
			friday = dateToday.plusDays(1);
			saturday = dateToday.plusDays(2);
			break;
		case FRIDAY:
			sunday = dateToday.minusDays(5);
			monday = dateToday.minusDays(4);
			tuesday = dateToday.minusDays(3);
			wednesday = dateToday.minusDays(2);
			thursday = dateToday.minusDays(1);
			friday = dateToday;
			saturday = dateToday.plusDays(1);
			break;
		case SATURDAY:
			sunday = dateToday.minusDays(6);
			monday = dateToday.minusDays(5);
			tuesday = dateToday.minusDays(4);
			wednesday = dateToday.minusDays(3);
			thursday = dateToday.minusDays(2);
			friday = dateToday.minusDays(1);
			saturday = dateToday;
			break;
		default:
			break;
		}

		String sundayString = sunday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String mondayString = monday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String tuesdayString = tuesday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String wednesdayString = wednesday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String thursdayString = thursday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String fridayString = friday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		String saturdayString = saturday.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));

		mav.addObject("sunday", sundayString);
		mav.addObject("monday", mondayString);
		mav.addObject("tuesday", tuesdayString);
		mav.addObject("wednesday", wednesdayString);
		mav.addObject("thursday", thursdayString);
		mav.addObject("friday", fridayString);
		mav.addObject("saturday", saturdayString);

		int progressTime = 0;
		String mealType = "";
		int timePerWeek = 0;
		
		if (favoriteDao.findByUserByDate(user, sundayString) != null) {
			progressTime += 100/7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, sundayString).getTotalTime();
			mav.addObject("sundayMeal",
					favoriteDao.findByUserByDate(user, sundayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, mondayString) != null) {
			progressTime += 100/7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, mondayString).getTotalTime();
			mav.addObject("mondayMeal",
					favoriteDao.findByUserByDate(user, mondayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, tuesdayString) != null) {
			progressTime += 100/7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, tuesdayString).getTotalTime();
			mav.addObject("tuesdayMeal",
					favoriteDao.findByUserByDate(user, tuesdayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, wednesdayString) != null) {
			progressTime += 100/7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, wednesdayString).getTotalTime();
			mav.addObject("wednesdayMeal",
					favoriteDao.findByUserByDate(user, wednesdayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, thursdayString) != null) {
			progressTime += 100/7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, thursdayString).getTotalTime();
			mav.addObject("thursdayMeal",
					favoriteDao.findByUserByDate(user, thursdayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, fridayString) != null) {
			progressTime += 100/7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, fridayString).getTotalTime();
			mav.addObject("fridayMeal",
					favoriteDao.findByUserByDate(user, fridayString));
			mealType = "favorite";
		}

		if (favoriteDao.findByUserByDate(user, saturdayString) != null) {
			progressTime += 100/7;
			timePerWeek = timePerWeek + favoriteDao.findByUserByDate(user, saturdayString).getTotalTime();
			mav.addObject("saturdayMeal",
					favoriteDao.findByUserByDate(user, saturdayString));
			mealType = "favorite";
		}
		
		if (myMealDao.findByUserByDate(user, sundayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + myMealDao.findByUserByDate(user, sundayString).getTotalTime();
			mav.addObject("sundayMeal", myMealDao.findByUserByDate(user, sundayString));
			
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, mondayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + myMealDao.findByUserByDate(user, mondayString).getTotalTime();
			mav.addObject("mondayMeal", myMealDao.findByUserByDate(user, mondayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, tuesdayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + myMealDao.findByUserByDate(user, tuesdayString).getTotalTime();
			mav.addObject("tuesdayMeal", myMealDao.findByUserByDate(user, tuesdayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, wednesdayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + myMealDao.findByUserByDate(user, wednesdayString).getTotalTime();
			mav.addObject("wednesdayMeal", myMealDao.findByUserByDate(user, wednesdayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, thursdayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + myMealDao.findByUserByDate(user, thursdayString).getTotalTime();
			mav.addObject("thursdayMeal", myMealDao.findByUserByDate(user, thursdayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, fridayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + myMealDao.findByUserByDate(user, fridayString).getTotalTime();
			mav.addObject("fridayMeal", myMealDao.findByUserByDate(user, fridayString));
			mealType = "myMeal";
		}

		if (myMealDao.findByUserByDate(user, saturdayString) != null) {
			progressTime += 100 / 7;
			timePerWeek = timePerWeek + myMealDao.findByUserByDate(user, saturdayString).getTotalTime();
			mav.addObject("saturdayMeal", myMealDao.findByUserByDate(user, saturdayString));
			mealType = "myMeal";
		}

		mav.addObject("progressTime", progressTime);
		mav.addObject("mealType", mealType);
		mav.addObject("timePerWeek", timePerWeek);
		
		return mav;
	}

	// user adds recipe to database from API search
	@PostMapping("/add-to-menu/{date}")
	public ModelAndView addRecipeToMenu(@SessionAttribute("user") User user,
			@RequestParam("label") String label, 
			@RequestParam("image") String image,
			@RequestParam("url") String url,
			@RequestParam("totalTime") int totalTime,
			@RequestParam("yield") int yield,
			@RequestParam("ingredient") String [] ingredientLines,
			@PathVariable("date") String date, RedirectAttributes redir) {

		// add user's chosen recipe to favorite table
		Favorite favorite = new Favorite();
		favorite.setUser(user);
		favorite.setLabel(label);
		favorite.setMealDate(date);
		favorite.setTotalTime(totalTime);
		favorite.setImage(image);
		favorite.setUrl(url);
		favorite.setYield(yield);
		
		String ingr = "";
		

		for (int i = 0; i < ingredientLines.length; i++) {
			
			if (i != ingredientLines.length - 1) {
			ingr += ingredientLines[i] + "++";
			}
			
			else {
				ingr += ingredientLines[i];
			}
		}
		
		favorite.setIngredientLines(ingr);
		
		favoriteDao.create(favorite);

		for (String line : ingredientLines) {
			ingredientDao.create(new Ingredient(line, favorite));
		}

		ModelAndView mav = new ModelAndView("redirect:/calendar");
		redir.addFlashAttribute("message", "Item added to favorites!");

		return mav;
	}

	// user adds recipe to calendar from favorites
	@PostMapping("/add-to-menu/favorites/{date}")

	public ModelAndView addFavoriteToMenu(@SessionAttribute("user") User user,
			@RequestParam("label") String label, 
			@RequestParam("image") String image,
			@RequestParam("url") String url,
			@RequestParam("totalTime") int totalTime,
			@RequestParam("yield") int yield,
			@RequestParam("ingredient") String [] ingredientLines,
			@PathVariable("date") String date, RedirectAttributes redir) {

		Favorite favorite = new Favorite();
		favorite.setUser(user);
		favorite.setLabel(label);
		favorite.setYield(yield );
		favorite.setMealDate(date);
		favorite.setTotalTime(totalTime);

		favorite.setImage(image);

		favorite.setUrl(url);
		
		String ingr = "";
		

		for (int i = 0; i < ingredientLines.length; i++) {
			
			if (i != ingredientLines.length - 1) {
			ingr += ingredientLines[i] + "++";
			}
			
			else {
				ingr += ingredientLines[i];
			}
		}
		
		favorite.setIngredientLines(ingr);

		favoriteDao.create(favorite);

		for (String line : ingredientLines) {
			ingredientDao.create(new Ingredient(line, favorite));
		}

		ModelAndView mav = new ModelAndView("redirect:/calendar");
		redir.addFlashAttribute("message", "Item added to favorites!");

		return mav;
	}

	// user chooses items on shopping list to merge
	@PostMapping("/add-to-menu/myMeals/{date}")

	public ModelAndView addMyMealToMenu(@SessionAttribute("user") User user,
			@RequestParam("label") String label, 
			@RequestParam("image") String image,
			@RequestParam("yield") int yield,
			@RequestParam("totalTime") int totalTime,
			@RequestParam("ingredientLines") String ingredientLines,

			@PathVariable("date") String date, RedirectAttributes redir) {

		MyMeal myMeal = new MyMeal();
		myMeal.setUser(user);
		myMeal.setLabel(label);
		myMeal.setMealDate(date);
		myMeal.setTotalTime(totalTime);
		myMeal.setImage(image);
		myMeal.setYield(yield);
		
		
		myMeal.setIngredientLines(ingredientLines);
		
		myMealDao.create(myMeal);
		
		String [] ingrArray = ingredientLines.split("--");

		for (String line : ingrArray) {
				ingredientDao.create(new Ingredient(line, myMeal));
				
		}
		

		ModelAndView mav = new ModelAndView("redirect:/calendar");
		redir.addFlashAttribute("message", "Item added to myMeals!");

		return mav;
	}

	// user chooses items on shopping list to merge
	@RequestMapping("/merge/{start}/{end}")
	public ModelAndView mergeIngredients(@SessionAttribute("user") User user, 
			@PathVariable("start") String start,
			@PathVariable("end") String end,
			@RequestParam("merge") List<Long> id) {

		// create a new list for items the user wants to merge
		List<Ingredient> mergeList = new ArrayList<>();
		// add every item in the user's list of checked items to the new list
		for (int i = 0; i < id.size(); i++) {
			mergeList.add(ingredientDao.findById(id.get(i)));
		}

		ModelAndView mav = new ModelAndView("merge");
		// add the new list to the ModelAndView
		mav.addObject("mergeList", mergeList);
		mav.addObject("start", start);
		mav.addObject("end", end);
		return mav;
	}
	
	// after user inputs new item from merge page, delete old ingredients & add new item
	@RequestMapping("/complete-merge/{start}/{end}")
	public ModelAndView completeMerge(@SessionAttribute("user") User user,
			@RequestParam("mergeList") List<Long> mergeList, 
			@PathVariable("start") String start,
			@PathVariable("end") String end,
			@RequestParam("newIngredient") String newIngredient) {
		
		// create new ingredient from user input
		Ingredient userIngredient = new Ingredient();
		userIngredient.setText(newIngredient);

		System.out.println();
		userIngredient.setFavorite(ingredientDao.findById(mergeList.get(0)).getFavorite());
		
		ingredientDao.create(userIngredient);
		
		// deletes items from merge list
		for (Long id : mergeList) {
			ingredientDao.delete(id);
		}

		ModelAndView mav = new ModelAndView("redirect:/shoppingcart/{start}/{end}");
		mav.addObject("start", start);
		mav.addObject("end", end);
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
			ModelAndView mav = new ModelAndView("login-form");
			mav.addObject("message", "Incorrect username or password.");
			return mav;
		}

		// On successful login, add the user to the session.
		session.setAttribute("user", user);

		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Logged in.");
		return new ModelAndView("redirect:/calendar");
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

	@RequestMapping("/shoppingcart/{start}/{end}")
	public ModelAndView showCart(@SessionAttribute("user") User user, 
			@PathVariable("start") String start, 
			@PathVariable("end") String end) {
		List<Ingredient> allList = ingredientDao.findAllByUser(user);
		List<Ingredient> shoppingList = new ArrayList<>();
		LocalDate startDate = LocalDate.parse(start, DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		LocalDate endDate = LocalDate.parse(end, DateTimeFormatter.ofPattern("MM-dd-uuuu"));
		LocalDate mealDate;
		
		for (Ingredient ingr : allList) {
			mealDate = LocalDate.parse(ingr.getFavorite().getMealDate(), DateTimeFormatter.ofPattern("MM-dd-uuuu"));
			
			if ((mealDate.isEqual(startDate) || mealDate.isAfter(startDate)) 
					&& (mealDate.isEqual(endDate) || mealDate.isBefore(endDate))) {
				shoppingList.add(ingr);
			}
		}
		ModelAndView mav = new ModelAndView("shoppingcart", "shoppingList", shoppingList);
		mav.addObject("start", start);
		mav.addObject("end", end);
		return mav;
	}
	
	@RequestMapping("/new-item-to-list")
	public ModelAndView addItemToList(@SessionAttribute("user") User user, 
			@RequestParam("newIngredient") String newIngredient,
			@RequestParam("favorite") List<Long> favoriteIds,
			RedirectAttributes redir) {
		
		Ingredient ingredient = new Ingredient();
		ingredient.setText(newIngredient);
		ingredient.setFavorite(favoriteDao.findById(favoriteIds.get(favoriteIds.size()-1)));
		ingredientDao.create(ingredient);
		
		redir.addFlashAttribute("message", "Item added to list");
		return new ModelAndView("redirect:/shoppingcart");
	}
	

	@RequestMapping("/shoppingcart/{id}/delete/{start}/{end}")
	public ModelAndView delete(@PathVariable("id") Long id,
			@PathVariable("start") String start, 
			@PathVariable("end") String end,
			RedirectAttributes redir) {
		ingredientDao.delete(id);
		System.out.println(start);
		ModelAndView mav = new ModelAndView("redirect:/shoppingcart/" + start + "/" + end + "");
		return mav;
	}

	@RequestMapping("/deleteFavorite/{date}")
	public ModelAndView deleteFavorite(@SessionAttribute("user") User user, @PathVariable("date") String date) {
		favoriteDao.delete(favoriteDao.findByUserByDate(user, date).getId());
		return new ModelAndView("redirect:/calendar");
	}

	@RequestMapping("/myrecipe")
	public ModelAndView addRecipe() {
		return new ModelAndView("myrecipe");
	}

	@PostMapping("/myrecipe")
	public ModelAndView submitRecipe(@SessionAttribute("user") User user, @RequestParam("label") String label,
			@RequestParam("totalTime") int totalTime,
			@RequestParam("yield") int yield, 
			@RequestParam("ingredientLines") String [] ingredientLines){
		ModelAndView mav = new ModelAndView("show-my-recipe");
		
		MyMeal mymeal = new MyMeal();
		mymeal.setLabel(label);
		mymeal.setTotalTime(totalTime);
		mymeal.setYield(yield);
		mymeal.setUser(user);
		
		
		String ingr = "";
		for(int i = 0; i<ingredientLines.length; i++) {
			if (i != ingredientLines.length -1 ) {
				ingr += ingredientLines[i] + "--";
			} else {
				ingr += ingredientLines[i];
			}
		}
		mymeal.setIngredientLines(ingr);
		myMealDao.create(mymeal);
		mav.addObject("myMeal", mymeal);
		mav.addObject("ingredientList", ingredientLines);
		
		
		return mav;
	}
//	@RequestMapping("show-my-recipe")
//	public ModelAndView showRecipe() {
//		ModelAndView mav = new ModelAndView("show-my-recipe");
//				return mav;
//	}
}