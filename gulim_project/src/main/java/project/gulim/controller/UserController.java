package project.gulim.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import io.jsonwebtoken.Claims;
import project.gulim.service.MainService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
public class UserController {

  @Autowired
  private MainService mainService;

  @GetMapping("/get-user-id")
  public ResponseEntity<Map<String, String>> getUserId(@CookieValue(name = "access_token", required = false) String jwtToken) {
    if (jwtToken != null) {
      Claims claims = mainService.getClaims(jwtToken);
      String id = claims.get("id", String.class);
      Map<String, String> response = new HashMap<>();
      response.put("id", id);
      
      System.out.println(response);
      
      return ResponseEntity.ok(response);
    } else {
      return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }
  }
}