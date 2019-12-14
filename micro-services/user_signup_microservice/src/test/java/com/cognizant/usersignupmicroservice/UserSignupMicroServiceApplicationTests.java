package com.cognizant.usersignupmicroservice;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import javax.validation.ConstraintViolationException;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.cognizant.usersignupmicroservice.entity.User;
import com.cognizant.usersignupmicroservice.exception.UserAlreadyExistsException;
import com.cognizant.usersignupmicroservice.repository.RegistrationRepository;
import com.cognizant.usersignupmicroservice.service.RegistrationService;

@SpringBootTest
public class UserSignupMicroServiceApplicationTests {
     
     @Autowired
     private RegistrationRepository registrationRepository;

     @Autowired
     private RegistrationService registrationService;
     
     @Test
     public void signUpValidTest() throws UserAlreadyExistsException {
          User user = new User(0, "qwert@gmail.com", "pass", "qwerty", "qwertyui", "9876549877", "ROLE_U", false, null);
          registrationService.register(user);
          assertEquals(user.toString(), registrationRepository.findById(user.getId()).get().toString());
          deleteUserTest(user);
     }
     
     @Test
     public void signUpExistingTest() throws UserAlreadyExistsException {
          User user = new User(0, "qwert@gmail.com", "pass", "qwerty", "qwertyui", "9876549877", "ROLE_U", false, null);
          registrationService.register(user);
          assertThrows(UserAlreadyExistsException.class, ()->     {registrationService.register(user);});
          deleteUserTest(user);
     }
     

     void deleteUserTest(User user) {
          registrationRepository.delete(user);
          assertEquals(false, registrationRepository.findById(user.getId()).isPresent());
     }
}
