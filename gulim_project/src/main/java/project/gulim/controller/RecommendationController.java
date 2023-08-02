package project.gulim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import project.gulim.client.Client;
import project.gulim.service.MainService;


@RestController
public class RecommendationController {

    @Autowired
    private MainService mainService;

    @Autowired
    private Client client;

    @GetMapping("/recommendations")
    public List<Client.Recommendation> getRecommendations(@RequestParam("userId") String userId) {
        // Call the getRecommendations method of the Client class to get the recommendations
    	
    	
        List<Client.Recommendation> recommendations = client.getRecommendations(userId);

        System.out.println(recommendations);
        // Return the recommendations as the HTTP response
        return recommendations;
    }
}





