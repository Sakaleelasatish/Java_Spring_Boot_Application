package hello;

import org.joda.time.LocalTime;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    @GetMapping("/time")
    public String getTime() {
        LocalTime currentTime = new LocalTime();
        return "The current local time is: " + currentTime;
    }

    @GetMapping("/greeting")
    public String getGreeting() {
        Greeter greeter = new Greeter();
        return greeter.sayHello();
    }
}

