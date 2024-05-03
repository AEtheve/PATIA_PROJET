package sokoban;

import java.io.File;

import com.codingame.gameengine.runner.SoloGameRunner;

public class SokobanMain {
    public static void main(String[] args) {
        // run a thread to run the game
        Thread t = new Thread(() -> {
            SoloGameRunner gameRunner = new SoloGameRunner();
            gameRunner.setAgent(Agent.class);

            //  ParserJSON.parse(System.getProperty("user.dir") + "/config/test2.json", "test2");
            // gameRunner.setTestCase("test2.json");

            String level = args[0];
            System.out.println("Running level: " + level);
            String path = System.getProperty("user.dir") + "/config/" + level + ".json";
            ParserJSON.parse(path, level);
            gameRunner.setTestCase(level + ".json");
            gameRunner.start();
        });

        t.start();
            
            

    }
}
