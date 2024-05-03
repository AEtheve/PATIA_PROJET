package sokoban;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;



public class Agent {
    public static void main(String[] args) {
        // String benchmark = "./benchmark";
        String benchmark = ".";
        String domain = benchmark + "/domain.pddl";
        String problem = benchmark + "/problem.pddl";

        String plan = "";
        try {
            problem = System.getProperty("user.dir") + "/config/tmp.pddl";
            ProcessBuilder pb = new ProcessBuilder("java", "-cp", "pddl4j-4.0.0.jar", "fr.uga.pddl4j.planners.statespace.HSP", domain, problem);
            // java -cp pddl4j-4.0.0.jar fr.uga.pddl4j.planners.statespace.FF ./benchmark/domain.pddl ./benchmark/problem.pddl
            
            

            Process p = pb.start();
            p.waitFor();

            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = "";
            while ((line = reader.readLine()) != null) {
                plan += line + "\n";
            }

            plan = plan.substring(plan.indexOf("found plan as follows:") + 24);
            plan = plan.substring(0, plan.indexOf("\n\ntime spent:"));

            String[] lines = plan.split("\n");
            for (int i = 0; i < lines.length; i++) {
                if (lines[i].contains("-gauche")) {
                    lines[i] = "L";
                } else if (lines[i].contains("-droite")) {
                    lines[i] = "R";
                } else if (lines[i].contains("-haut")) {
                    lines[i] = "U";
                } else if (lines[i].contains("-bas")) {
                    lines[i] = "D";
                } else {
                    lines[i] = "";
                }
            }
            plan = String.join("", lines);
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
          
        BufferedWriter writer = null;
        try {
            writer = new BufferedWriter(new FileWriter("test.output"));
            writer.write(plan);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        for (char c : plan.toCharArray()) System.out.println(c);
    }
}
