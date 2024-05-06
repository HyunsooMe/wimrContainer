package kr.ac.dankook.ace.whatsinmyref;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class WhatsInMyRefApplication {

	public static void main(String[] args) {
		SpringApplication.run(WhatsInMyRefApplication.class, args);
	}

}
	