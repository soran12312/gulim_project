package project.gulim.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.http.HttpHost;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.ArrayNode;

@Component
public class MariaDBToElasticSearch_CharacterSheet {

	
	// ElasticSearch 클러스터 호스트 및 포트 설정 (주소는 적절하게 변경)
    private static final String ES_HOST = "localhost";
    private static final int ES_PORT = 9200;

    // MariaDB 접속 정보
    private static final String DB_URL = "jdbc:mariadb://192.168.0.68:3306/gulim"; // 데이터베이스 이름으로 변경
    private static final String DB_USER = "gulim";
    private static final String DB_PASSWORD = "1234";

    // 데이터를 색인할 인덱스 이름
    private static final String INDEX_NAME = "character_sheet";

    public void indexDataFromMariaDB() {
    		// MariaDB 연결 설정
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        	 // SQL문 실행을 위한 객체	
             Statement statement = connection.createStatement();
        	 // ElasticSearch 클라이언트 설정
        		// 1. Elasticsearch 클러스트와 통신할 호스트의 세부 정보
        		// 2. RestClient.builder 메소드 호출 - 호스트의 세부 정보 받아서 클라이언트 세부 설정 구성함
        		// 3. RestHighLevelClient 객체 생성 - Elasticsearch와 상호작용할 수 있는 클라이언트 객체, 엘라스틱서치 사용 가능해짐
             RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

        	// SQL 쿼리
            String sql = "SELECT sheet_num, char_propensity, char_class, species, str, dex, con, intelligence, wis, chr FROM character_sheet";
            // 쿼리 실행
            ResultSet resultSet = statement.executeQuery(sql);

            // JSON 매핑을 위한 ObjectMapper 객체 생성
        	// 즉, Java객체를 JSON 문자열로 변환하는 직렬화 or JSON 문자열을 Java 객체로 변환하는 역직렬화
            ObjectMapper objectMapper = new ObjectMapper();

            // 결과 집합 반복
            while (resultSet.next()) {
            	// 결과 집합에서 필드 값을 가져오기
            	Integer sheetNum = resultSet.getInt("sheet_num");
                String charPropensity = resultSet.getString("char_propensity");
                String charClass = resultSet.getString("char_class");
                String species = resultSet.getString("species");
                Integer str = resultSet.getInt("str");
                Integer dex = resultSet.getInt("dex");
                Integer con = resultSet.getInt("con");
                Integer intelligence = resultSet.getInt("intelligence");
                Integer wis = resultSet.getInt("wis");
                Integer chr = resultSet.getInt("chr");

                // JSON 객체 생성
                ObjectNode jsonObject = objectMapper.createObjectNode();
                jsonObject.put("char_propensity", charPropensity);
                jsonObject.put("char_class", charClass);
                jsonObject.put("species", species);
                jsonObject.put("str", str);
                jsonObject.put("dex", dex);
                jsonObject.put("con", con);
                jsonObject.put("intelligence", intelligence);
                jsonObject.put("wis", wis);
                jsonObject.put("chr", chr);
                

                // JSON 객체를 문자열로 변환
                String jsonBody = jsonObject.toString();

                // ElasticSearch에 데이터 색인
                IndexRequest request = new IndexRequest(INDEX_NAME).id(Integer.toString(sheetNum)).source(jsonBody, XContentType.JSON);
                IndexResponse response = client.index(request, RequestOptions.DEFAULT);
                
                System.out.println(jsonBody);
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {
        MariaDBToElasticSearch_CharacterSheet indexer = new MariaDBToElasticSearch_CharacterSheet();
        indexer.indexDataFromMariaDB();
    }
	
}