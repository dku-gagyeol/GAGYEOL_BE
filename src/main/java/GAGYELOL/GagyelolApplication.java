package GAGYELOL;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.TimeZone;

@SpringBootApplication
public class GagyelolApplication {

	public static void main(String[] args) {
		// 결재 시각 등 LocalDateTime.now()·@CreationTimestamp 값을 한국 시간으로 저장.
		// (Docker/EC2 기본 시간대가 UTC라 21:52 승인이 12:52로 표시되던 문제)
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		SpringApplication.run(GagyelolApplication.class, args);
	}

}
