package kr.ac.dankook.ace.whatsinmyref;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import java.io.IOException;

@SpringBootApplication
public class WhatsInMyRefApplication{
	public static void main(String[] args) {
		SpringApplication.run(WhatsInMyRefApplication.class, args);
	}
}