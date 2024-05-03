// {
// 	"title": {
// 		"2": "Scoria 3 - Level 1"
// 	},
// 	"testIn": "  ####\n  #  #\n ##  #\n##  .#\n# * *##\n#@#$* ###\n# *     #\n####    #\n   ######",
// 	"isTest": "true",
// 	"isValidator": "true"
// }
// (:predicates
// 	(player-on ?p - player ?c - case)
// 	(bloc-on ?b - bloc ?c - case)
// 	(libre ?c - case) 
// 	(voisin-gauche ?c - case ?c2 - case)
// 	(voisin-droite ?c - case ?c2 - case)
// 	(voisin-haut ?c - case ?c2 - case)
// 	(voisin-bas ?c - case ?c2 - case)
//   )


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

class ParserJSON {
   
    // open test.json:
    ParserJSON(String path) {
        try {
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(new java.io.FileReader(path));
            // on récupère les cases
            String testIn = (String) jsonObject.get("testIn");
            String[] lines = testIn.split("\n");
            int cases[][] = new int[lines.length][lines[0].length()];
            int nbBoites = 0;
            for (int i = 0; i < lines.length; i++) {
                for (int j = 0; j < lines[i].length(); j++) {
                    switch (lines[i].charAt(j)) {
                        case '#':
                            // mur
                            cases[i][j] = 1;
                            break;
                        case ' ':
                        //case vide
                            cases[i][j] = 0;
                            break;
                        case '.':
                        //destination
                            cases[i][j] = 2;
                            break;
                        case '*':
                        //boite sur destination
                            cases[i][j] = 3;
                            nbBoites++;
                            break;
                        case '@':
                        //joueur
                            cases[i][j] = 4;
                            break;
                        case '$':
                        //boite
                            cases[i][j] = 5;
                            nbBoites++;
                            break;
                        case '+':
                        //joueur sur destination
                            cases[i][j] = 6;
                            break;
                    }
                }
            }
            try {
                path = path.substring(0, path.lastIndexOf('.'));
                java.io.FileWriter file = new java.io.FileWriter(path + ".pddl");
                file.write("(define (problem sokoban_" + path + ")\n");
                file.write("(:domain sokoban_" + path + ")\n");
                file.write("(:objects \n");
                for (int i = 0; i < cases.length * cases[i].length; i++) {
                    file.write("c" + i + " ");
                }
                file.write("- case\n");
                file.write("j - joueur\n");
                for (int i = 0; i < nbBoites; i++) {
                    file.write("b" + i + " ");
                }
                file.write("- bloc)\n");
                file.write("(:init\n");
                for (int i = 0; i < cases.length; i++) {
                    for (int j = 0; j < cases[i].length; j++) {
                        file.write("(voisin-gauche c" + i + " c" + (i * cases[i].length + j - 1) + ")\n");
                            
                    }
                }
                file.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        new ParserJSON("test.json");
    }
}