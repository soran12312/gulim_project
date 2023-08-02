package project.gulim.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import project.gulim.client.Client;



@Component
public class UserLoggedInEventListener implements ApplicationListener<UserLoggedInEvent> {

    @Autowired
    private Client client;

    @Override
    public void onApplicationEvent(UserLoggedInEvent event) {
        String userId = (String) event.getSource();
        // Call the getRecommendations() method of the Client class
        client.getRecommendations(userId);
    }
}