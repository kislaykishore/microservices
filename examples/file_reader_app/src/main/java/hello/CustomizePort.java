package hello;
import org.springframework.boot.web.server.*;
import org.springframework.boot.web.servlet.server.*;
import org.springframework.stereotype.Component;
import org.springframework.boot.web.embedded.tomcat.*;


@Component
public class CustomizePort
            implements WebServerFactoryCustomizer< ConfigurableWebServerFactory > {
   
    @Override
    public void customize(ConfigurableWebServerFactory factory) {
        String port = System.getenv("PORT");
        if(port == null) {
            port = "8080";
        }
        factory.setPort(Integer.parseInt(port));
    }
}
