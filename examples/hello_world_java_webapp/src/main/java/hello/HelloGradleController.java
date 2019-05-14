package hello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/")
public class HelloGradleController {
    @GetMapping
    public String helloGradle() {
        String name = System.getenv("name");
        if(name == null) {
            name = "World!";
        }
        return "Hello " + name + "!";
    }
}
