package sokoban;

//exemple à écrire dans un fichier à partir d'un json
// (define (problem pbSOKO) (:domain sokoban)

// (:objects
//     p - player
//     b - bloc
//     c1 c2 c3 c4 - case
// )


// (:init
// (player-on p c4)
// (bloc-on b c2)
// (libre c1)
// (libre c3)
// (libre c4)
// (voisin-haut c1 c2)
// (voisin-bas c2 c1)
// (voisin-haut c2 c3)
// (voisin-bas c3 c2)
// (voisin-haut c3 c4)
// (voisin-bas c4 c3)
// (goal c1)

// )


// (:goal (and
//     (goal-ok c1)
// ))
// )

import java.lang.reflect.Array;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import java.util.ArrayList;

class ParserJSON {
    static String currentTest;
    static public void parse(String path, String name) {
        try {
            currentTest = System.getProperty("user.dir") + "/config/test0.json";
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(new java.io.FileReader(path));
            // on récupère les cases
            String testIn = (String) jsonObject.get("testIn");
            String[] lines = testIn.split("\n");
            // int[][] cases = new int[lines.length][lines[0].length()];
            // String[][] casesLibres = new String[lines.length][lines[0].length()];
            // get max length of lines
            int maxLength = 0;
            for (int i = 0; i < lines.length; i++) {
                if (lines[i].length() > maxLength) {
                    maxLength = lines[i].length();
                }
            }
            char[][] cases = new char[lines.length][maxLength];
            String[][] casesLibres = new String[lines.length][maxLength];
            //remplir le tableau de cases
            for (int i = 0; i < lines.length; i++) {
                for (int j = 0; j < lines[i].length(); j++) {
                    cases[i][j] = lines[i].charAt(j);
                }
            }

            //tableau d'indice cases libres -1 si c'est un mur
            int k=1;
            for (int i = 0; i < lines.length; i++) {
                for (int j = 0; j < lines[i].length(); j++) {
                    if (cases[i][j] == '#') {
                        casesLibres[i][j] = "";
                    }
                    else{
                        casesLibres[i][j] = "c" + k;
                        k++;
                    }
                }
            } 
            HashMap<String, String> voisins_droite = new HashMap<String, String>();
            HashMap<String, String> voisins_gauche = new HashMap<String, String>();
            HashMap<String, String> voisins_haut = new HashMap<String, String>();
            HashMap<String, String> voisins_bas = new HashMap<String, String>();
            HashMap<Integer, String> bloc_on = new HashMap<Integer, String>();
            
            ArrayList<String> goal_ok = new ArrayList<String>();
            ArrayList<String> libre = new ArrayList<String>();
            ArrayList<String> goals = new ArrayList<String>();


            int nbB = 1;
            //on récupère les voisins de chaque case
            for (int i = 0; i < lines.length; i++) {
                for (int j = 0; j < lines[i].length(); j++) {
                    if (cases[i][j] != '#') {
                        if (i > 0 && cases[i - 1][j] != '#') {
                            // i-1,j  voisin haut de i,j
                            String value = casesLibres[i][j];
                            String key = casesLibres[i - 1][j];
                            voisins_haut.put(key, value);
                        }
                        if (i < lines.length - 1 && cases[i + 1][j] != '#') {
                            // i+1,j  voisin bas de i,j
                            String value = casesLibres[i][j];
                            String key = casesLibres[i + 1][j];
                            voisins_bas.put(key, value);
                        }
                        if (j > 0 && cases[i][j - 1] != '#') {
                            // i,j-1  voisin gauche de i,j
                            String value = casesLibres[i][j];
                            String key = casesLibres[i][j - 1];
                            voisins_gauche.put(key, value);
                        }
                        if (j < lines[i].length() - 1 && cases[i][j + 1] != '#') {
                            //int[] voisin = { i, j - 1 };
                            //voisin_droite.add(voisin);
                            // i,j+1  voisin droite de i,jcase
                            String value = casesLibres[i][j];
                            String key = casesLibres[i][j + 1];
                            voisins_droite.put(key, value);

                        }
                    }
                    if (cases[i][j] == '$') {
                        String value = casesLibres[i][j];
                        // bloc_on.add(nbB,value);
                        bloc_on.put(nbB,value);
                        nbB++;
                    }
    
                    if(cases[i][j] == '*'){
                        String value = casesLibres[i][j];
                        bloc_on.put(nbB,value);
                        goal_ok.add(value);
                        nbB++;
                    }

                    if(cases[i][j] == ' ' || cases[i][j] == '.' || cases[i][j] == '@' || cases[i][j] == '+'){
                        String value = casesLibres[i][j];
                        libre.add(value);
                    }

                    if(cases[i][j] == '.' || cases[i][j] == '*' || cases[i][j] == '+'){
                        String value = casesLibres[i][j];
                        goals.add(value);
                    }

                }
            }
            int nbCasesDispo = 0;
            for (int i = 0; i < lines.length; i++) {
                for (int j = 0; j < lines[i].length(); j++) {
                    switch (lines[i].charAt(j)) {
                        case '#': //mur
                            break;
                        case ' ': //fond
                            nbCasesDispo++;
                            break;
                        case '.': //destination 
                            nbCasesDispo++;
                            break;
                        case '*': //boite sur destination
                            nbCasesDispo++;
                            break;
                        case '@': //joueur
                            nbCasesDispo++;
                            break;
                        case '$': //boite 
                            nbCasesDispo++;
                            break;
                        case '+': //joueur sur destination
                            nbCasesDispo++;
                            break;
                    }
                }
            }


            try {
                path = path.substring(0, path.lastIndexOf('.'));
                java.io.FileWriter file = new java.io.FileWriter("./config/tmp" + ".pddl");
                file.write("(define (problem sokoban_" + name + ")\n");
                file.write("(:domain sokoban)\n");
                //OBJECTS          
                //Ecriture cases disponibles
                System.out.println("nbCasesDispo : " + nbCasesDispo);
                file.write("(:objects");
                for(int i = 1; i <=nbCasesDispo; i++){
                    file.write(" c" + i);
                }
                file.write(" - case\n");

                file.write(")\n");

                //INIT
                file.write("(:init\n");
                // //Ecriture des voisins
                
                for(int i = 0; i < voisins_gauche.size(); i++){
                    String key = (String) voisins_gauche.keySet().toArray()[i];
                    String value = (String) voisins_gauche.values().toArray()[i];
                    file.write("(voisin-gauche " + key + " " + value + ")\n");
                }

                for(int i = 0; i < voisins_haut.size(); i++){
                    String key = (String) voisins_haut.keySet().toArray()[i];
                    String value = (String) voisins_haut.values().toArray()[i];
                    file.write("(voisin-haut " + key + " " + value + ")\n");
                }

                for (int i = 0; i < cases.length; i++) {
                    for (int j = 0; j < cases[i].length; j++) {
                        if(cases[i][j] == '@' || cases[i][j] == '+'){
                            file.write("(player-on " + casesLibres[i][j] + ")\n");
                        }
                    }
                }
                //ecriture boites
                for (int i = 0; i < bloc_on.size(); i++) {
                    String value = bloc_on.get(i+1);
                    file.write("(bloc-on " + value + ")\n");
                }
                // //ecriture cases libres
                for (int i = 0; i < libre.size(); i++) {
                    file.write("(libre " + libre.get(i) + ")\n");
                }
                
                file.write(")\n");
                file.write("\n");
                file.write("(:goal\n");
                    file.write("(and\n");
                for (int i = 0; i < goals.size(); i++) {;
                    file.write("(bloc-on " + goals.get(i) + ")\n");
                }
                file.write(")\n");
                file.write(")\n");
                file.write(")\n");



                
                file.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}