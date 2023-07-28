package project.gulim.util;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class PollingMariaDB {
	private static final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    public static void startPolling() {
        Runnable task = new Runnable() {
            public void run() {
                // 데이터베이스에서 데이터를 읽고 ElasticSearch에 색인하는 코드
                MariaDBToElasticSearch_Survey indexer = new MariaDBToElasticSearch_Survey();
                indexer.indexDataFromMariaDB();
            }
        };

        // 1시간마다 작업 실행
        scheduler.scheduleAtFixedRate(task, 0, 1, TimeUnit.HOURS);
    }

    public static void main(String[] args) {
        startPolling();
    }
}