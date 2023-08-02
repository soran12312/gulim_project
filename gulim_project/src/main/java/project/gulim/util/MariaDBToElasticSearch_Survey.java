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
public class MariaDBToElasticSearch_Survey {

	
	// ElasticSearch 클러스터 호스트 및 포트 설정 (주소는 적절하게 변경)
    private static final String ES_HOST = "localhost";
    private static final int ES_PORT = 9200;

    // MariaDB 접속 정보
    private static final String DB_URL = "jdbc:mariadb://192.168.0.68:3306/gulim"; // 데이터베이스 이름으로 변경
    private static final String DB_USER = "gulim";
    private static final String DB_PASSWORD = "1234";

    // 데이터를 색인할 인덱스 이름
    private static final String INDEX_NAME = "survey";

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
            String sql = "SELECT survey_num, play_rull, play_genre, play_period, play_species, master, want_genre, play_class, other_site FROM survey";
            // 쿼리 실행
            ResultSet resultSet = statement.executeQuery(sql);

            // JSON 매핑을 위한 ObjectMapper 객체 생성
            	// 즉, Java객체를 JSON 문자열로 변환하는 직렬화 or JSON 문자열을 Java 객체로 변환하는 역직렬화
            ObjectMapper objectMapper = new ObjectMapper();

            // 결과 집합 반복
            while (resultSet.next()) {
            	// 결과 집합에서 필드 값을 가져오기
                Integer surveyNum = resultSet.getInt("survey_num");
                String playRull = resultSet.getString("play_rull");
                String playGenre = resultSet.getString("play_genre");
                String playPeriod = resultSet.getString("play_period");
                String playSpecies = resultSet.getString("play_species");
                Integer master = resultSet.getInt("master");
                String wantGenre = resultSet.getString("want_genre");
                String playClass = resultSet.getString("play_class");
                String otherSite = resultSet.getString("other_site");

                // 필드 값 분할: 던앤던/크툴룬을 던앤던 크툴룬 이렇게 분리
                String[] playRullTokens = playRull.split("/");
                String[] playGenreTokens = playGenre.split("/");
                String[] playSpeciesTokens = playSpecies.split("/");
                String[] wantGenreTokens = wantGenre.split("/");
                String[] playClassTokens = playClass.split("/");

                // JSON 객체 생성
                ObjectNode jsonObject = objectMapper.createObjectNode();
                jsonObject.put("play_period", playPeriod);
                jsonObject.put("master", master);
                jsonObject.put("other_site", otherSite);
                
                // 배열 노드 추가: ["던전앤드래곤","다크소울"] 이런 거
                ArrayNode playRullArray = jsonObject.putArray("play_rull");
                for (String token : playRullTokens) {
                	// 배열 노드에 값 추가
                    playRullArray.add(token);
                }

                ArrayNode playGenreArray = jsonObject.putArray("play_genre");
                for (String token : playGenreTokens) {
                    playGenreArray.add(token);
                }

                ArrayNode playSpeciesArray = jsonObject.putArray("play_species");
                for (String token : playSpeciesTokens) {
                    playSpeciesArray.add(token);
                }

                ArrayNode wantGenreArray = jsonObject.putArray("want_genre");
                for (String token : wantGenreTokens) {
                    wantGenreArray.add(token);
                }

                ArrayNode playClassArray = jsonObject.putArray("play_class");
                for (String token : playClassTokens) {
                    playClassArray.add(token);
                }

                // JSON 객체를 문자열로 변환
                String jsonBody = jsonObject.toString();

                // ElasticSearch에 데이터 색인
                IndexRequest request = new IndexRequest(INDEX_NAME).id(Integer.toString(surveyNum)).source(jsonBody, XContentType.JSON);
                IndexResponse response = client.index(request, RequestOptions.DEFAULT);
                
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {
        MariaDBToElasticSearch_Survey indexer = new MariaDBToElasticSearch_Survey();
        // 실행
        indexer.indexDataFromMariaDB();
    }
	
	
	
}