package project.gulim.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.ServletContext;


@Controller
public class ImageController {
	
	@Autowired
	private ServletContext servletContext;
	
	
	// 이미지 파일 불러오기
	@GetMapping("/images/gulim/{fileName:.+}")
	public ResponseEntity<Resource> getImage(@PathVariable String fileName) throws IOException {
	    // 이미지 파일 경로
	    String imagePath = servletContext.getRealPath("/images/gulim/");

	    // 이미지 파일 읽기
	    File imageFile = new File(imagePath + fileName);
	    Resource resource = new UrlResource(imageFile.toURI());

	    // 응답으로 이미지 파일 전송
	    return ResponseEntity.ok()
	            .contentType(MediaType.IMAGE_PNG)
	            .body(resource);
	}
}