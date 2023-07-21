package project.gulim.domain;

import java.util.Map;

import lombok.Data;

@Data
public class SubscribeDTO {

	private Integer sub_num;
	private String start_date;
	private String end_date;
	private Integer price;
	private String id;
	private String sub_date;
	
	// Map에서 SubscribeDTO 객체 생성하는 메서드
	public static SubscribeDTO createFromMap(Map<String, Object> subscriptionDataMap) {
	    // Map으로부터 필드 값을 추출하여 SubscribeDTO 객체 생성
	    SubscribeDTO subscribeDTO = new SubscribeDTO();
	    
	    // price를 문자열로부터 숫자로 변환하여 저장
	    String priceStr = (String) subscriptionDataMap.get("price");
	    int price = Integer.parseInt(priceStr.replaceAll("[^0-9]", ""));
	    subscribeDTO.setPrice(price);

	    return subscribeDTO;
	}
	
}
