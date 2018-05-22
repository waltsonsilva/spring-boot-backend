package mcagile.com.config;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import mcagile.com.services.DBService;
import mcagile.com.services.EmailService;
import mcagile.com.services.MockEmailService;

@Configuration
@Profile("test")
public class TestConfig {
	
	@Autowired
	private DBService dbService;
	
	@Bean
	public boolean intantiateDataVase() throws ParseException {
		
		dbService.instantiateTestDataBase();
		return true;
		
	}
	
	@Bean
	public EmailService emailService() {
		return new MockEmailService();
	}
}
