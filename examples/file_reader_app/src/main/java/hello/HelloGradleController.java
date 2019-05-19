package hello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.io.File;

@RestController("/")
public class HelloGradleController {
    @GetMapping("/inc")
    public String helloGradle() throws Exception {
        String filePath = System.getenv("fpath");
        if(filePath == null) {
            filePath = "/data/file.txt";
        }
        File myFile = new File(filePath);
        myFile.createNewFile();
        List<String> lines = Files.readAllLines(Path.of(filePath));
        Integer count = 0;
        if(lines.size() != 0) {
            int val = Integer.parseInt(lines.get(0));
            count = val + 1;
        }
        Files.write(Path.of(filePath), count.toString().getBytes());
        return "Read this number from the file: " + lines.get(0);
    }

    @GetMapping("/count")
    public int getCount() throws Exception {
        String filePath = System.getenv("fpath");
        if(filePath == null) {
            filePath = "/data/file.txt";
        }
        File myFile = new File(filePath);
        myFile.createNewFile();
        List<String> lines = Files.readAllLines(Path.of(filePath));
        Integer count = 0;
        if(lines.size() != 0) {
            count = Integer.parseInt(lines.get(0));
        }
        return count;
    }
}
