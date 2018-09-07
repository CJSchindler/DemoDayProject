package co.grandcircus.FinalProject.DemoDay;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.FinalProject.DemoDay.entity.Result;

@Controller
public class RecipeController {

	@RequestMapping("/")
	public ModelAndView showIndex() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
	
	@RequestMapping("/display")
	public ModelAndView showList() {
		ModelAndView mav = new ModelAndView("display");
		
		RestTemplate restTemplate = new RestTemplate();
		
		String mainIngredient = "chicken";
		int maxTotalTime = 20;
		
//		String url = "&calories=591-722&health=alcohol-free"
		String url = "https://api.edamam.com/search?q=" + mainIngredient  
				+ "&app_id=328dd333"
				+ "&app_key=2925530f7873bcd09aa1376f5114f08d"
				+ "&from=0&to=10" //number of results
				+ "&time=1-" + maxTotalTime; //total time is between 1 and maxTotalTime
		
//		String url = "https://api.edamam.com/search?q=chicken&app_id=328dd333&app_key=2925530f7873bcd09aa1376f5114f08d";
		
		ResponseEntity<Result> response = restTemplate.exchange(
		      url, HttpMethod.GET, new HttpEntity<>(null),Result.class);
		
		Result result = response.getBody();
		
//		System.out.println(result.getHits());
		
		mav.addObject("recipelist", result.getHits());
		
//		System.out.println(result);
		return mav;
	}
}
