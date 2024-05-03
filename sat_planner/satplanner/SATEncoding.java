package satplanner;

import fr.uga.pddl4j.parser.DefaultParsedProblem;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.util.BitVector;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.operator.Action;

import java.util.ArrayList;
import java.util.List;

import org.sat4j.pb.SolverFactory;
import org.sat4j.specs.IProblem;
import org.sat4j.specs.ISolver;
import org.sat4j.core.VecInt;


import java.util.HashMap;

/**
 * This class implements a planning problem/domain encoding into DIMACS
 *
 * @author H. Fiorino
 * @version 1.0 - 30.03.2021
 */
public final class SATEncoding {
    /*
     * A SAT problem in dimacs format is a list of int list a.k.a clauses
     */
    private ArrayList<List<Integer>> dimacs;

    /*
     * Current number of steps of the SAT encoding
     */
    private int steps;

    Problem problem;

    ArrayList<List<Integer>> goalsIndex = new ArrayList<>();

    /**
     *
     * @param
     */
    public SATEncoding(final Problem problem, final int steps) {
        super();
        this.steps = steps;
        this.dimacs = new ArrayList<>();
        this.problem = problem;
        encode(problem, steps);

    }

    HashMap<Integer, Integer> predicatsMap = new HashMap<>();
    HashMap<Integer, Integer> actionsMap = new HashMap<>();
    Integer ident = 1;

    public void encode(final Problem problem, final int stepsO) {
        int steps = stepsO;
        if (steps == 0) {
            //si on est au premier step
            //on récupère le vecteur de prédicats de l'état initial du problème
            // si la prédicat est vrai dans l'état initial le bit correspondant est à vrai sinon à faux
            BitVector positives = problem.getInitialState().getPositiveFluents();
            System.out.println("Initial state: " + positives);
            //pour chaque prédicat l'ajoute à la liste des clauses si il est vrai dans l'état initial
            // et l'ajoute à la liste des clauses avec un signe négatif si il est faux

            for (int i = 0; i < problem.getFluents().size(); i++) {
                if (positives.get(i)) {
                    final List<Integer> clause = new ArrayList<>();

                    predicatsMap.put(pair(i + 1, 1), ident);
                    ident++;

                    clause.add(predicatsMap.get(pair(i + 1, 1)));
                    dimacs.add(clause);
                } else {
                    final List<Integer> clause = new ArrayList<>();

                    predicatsMap.put(pair(i + 1, 1), ident);
                    ident++;

                    clause.add(-predicatsMap.get(pair(i + 1, 1)));
                    dimacs.add(clause);
                }

            }
            System.out.println("DIMACS: " + dimacs);
            // System.exit(1);

            steps = 1;
        } else {
            // à chaque step on veut modifier le but 
            // afin que le solver puisse réaliser une action suplémentaire afin de satisfaire le but
            // car la clé associée au goal dépend du nombre de steps
            // on supprime donc les clauses du but précédent
            for (int i = 0; i < goalsIndex.size(); i++) {
                dimacs.remove(goalsIndex.get(i));
                System.out.println("goal to remove: " + goalsIndex.get(i));
            }

            goalsIndex.clear();

            System.out.println("DIMACS_S: " + dimacs.size());
        }

        // actions:
        List<Action> actions = problem.getActions();
        // pour chacune des actions on récupère les préconditions nécéssaires à la réalisation de cette action et les effets de cette dernière
        for (int i = 0; i < actions.size(); i++) {
            Action a = actions.get(i);

            BitVector pre = a.getPrecondition().getPositiveFluents(); //liste des prédicats qui sont à vrai si nécessaire pour réaliser l'action 
            BitVector pos = a.getUnconditionalEffect().getPositiveFluents(); //liste des prédicats qui sont à vrai si vrai après réalisation de l'action 
            BitVector neg = a.getUnconditionalEffect().getNegativeFluents(); //liste des prédicats qui sont à vrai si faux après réalisation de l'action 

            for (int j = 0; j < pos.size(); j++) {
                if (pre.get(j)) {
                    final List<Integer> clause = new ArrayList<>();
                    
                    //si l'action et sa clée correspondante à la nouvelle étape n'existe pas on l'ajoute à la liste des actions
                    if (!actionsMap.containsKey(pair(i + 1, steps))) {
                        actionsMap.put(pair(i + 1, steps), ident);
                        ident++;
                    } 
                    // on ajoute une clause pour chaque prédicat qui doit être vrai pour pouvoir réaliser l'action
                    // qui dit que ou le prédicat est vrai ou l'action n'est pas réalisable
                    clause.add(-actionsMap.get(pair(i + 1, steps)));
                    clause.add(predicatsMap.get(pair(j + 1, steps)));
                    dimacs.add(clause);

                    System.out.println("ajout pre: " + clause);
                }

                if (pos.get(j)) {
                    final List<Integer> clause = new ArrayList<>();

                    if (!actionsMap.containsKey(pair(i + 1, steps))) {
                        actionsMap.put(pair(i + 1, steps), ident);
                        ident++;
                    }

                    clause.add(-actionsMap.get(pair(i + 1, steps)));
                    //on ajoute une clause pour chaque prédicat qui est vrai après réalisation de l'action 
                    // qui dit que l'action n'est pas réalisée ou le prédicat ne sera pas vrai donc que si l'action est réalisée le prédicat sera vrai
                
                    if (!predicatsMap.containsKey(pair(j + 1, steps + 1))) {
                        predicatsMap.put(pair(j + 1, steps + 1), ident);
                        ident++;
                    }
                    clause.add(predicatsMap.get(pair(j + 1, steps + 1)));
                    dimacs.add(clause);

                    System.out.println("ajout pos: " + clause);
                }

                if (neg.get(j)) {
                    final List<Integer> clause = new ArrayList<>();

                    if (!actionsMap.containsKey(pair(i + 1, steps))) {
                        actionsMap.put(pair(i + 1, steps), ident);
                        ident++;
                    }

                    clause.add(-actionsMap.get(pair(i + 1, steps)));
                    //on ajoute une clause pour chaque prédicat qui est faux après réalisation de l'action
                    // qui dit que l'action n'est pas réalisée ou le prédicat ne sera pas faux à l'étape suivante
                    if (!predicatsMap.containsKey(pair(j + 1, steps + 1))) {
                        predicatsMap.put(pair(j + 1, steps + 1), ident);
                        ident++;
                    }
                    clause.add(-predicatsMap.get(pair(j + 1, steps + 1)));
                    dimacs.add(clause);

                    System.out.println("ajout neg: " + clause);
                }

            }

            System.out.println("\nDIMACS_ACT : " + i + " " + dimacs.size());
            System.out.println(dimacs);

        }

        // exclusion axiom:
        // on ajoute des clauses qui disent que deux actions différentes ne peuvent pas être réalisées en même temps
        for (int i = 0; i < problem.getActions().size(); i++) {
            for (int j = 0; j < problem.getActions().size(); j++) {
                if (i != j) {
                    final List<Integer> clause = new ArrayList<>();
                    if (!actionsMap.containsKey(pair(i + 1, steps))) {
                        actionsMap.put(pair(i + 1, steps), ident);
                        ident++;
                    }
                    clause.add(-actionsMap.get(pair(i + 1, steps)));
                    if (!actionsMap.containsKey(pair(j + 1, steps))) {
                        actionsMap.put(pair(j + 1, steps), ident);
                        ident++;
                    }
                    clause.add(-actionsMap.get(pair(j + 1, steps)));
                    
                    dimacs.add(clause);
                    System.out.println("exclusion: " + clause);
                }
            }
        }

        

        // Action effects:
        for (int i = 0; i < problem.getFluents().size(); i++) {
            ArrayList<Integer> getPosEffects = new ArrayList<>();
            ArrayList<Integer> getNegEffects = new ArrayList<>();


            // pour chaque prédicat on récupère les actions qui ont un effet positif ou négatif sur ce prédicat
            for (int j = 0; j < problem.getActions().size(); j++) {
                Action a = problem.getActions().get(j);
                BitVector pos = a.getUnconditionalEffect().getPositiveFluents();
                BitVector neg = a.getUnconditionalEffect().getNegativeFluents();

                if (pos.get(i)) {
                    getPosEffects.add(j);
                }

                if (neg.get(i)) {
                    getNegEffects.add(j);
                }
            }

            if (getPosEffects.size() > 0) {
                // pour chaque prédicat on ajoute une clause qui dit que soit le prédicat est faux à l'étape suivante 
                // soit une des actions qui a un effet positif sur ce prédicat est réalisée
                // soit le prédicat est déjà vrai 
                final List<Integer> clause = new ArrayList<>();
                clause.add(-predicatsMap.get(pair(i + 1, steps + 1)));
                clause.add(predicatsMap.get(pair(i + 1, steps)));

                for (int j = 0; j < getPosEffects.size(); j++) {
                    clause.add(actionsMap.get(pair(getPosEffects.get(j) + 1, steps)));
                }

                dimacs.add(clause);

                System.out.println("DIMACS_ACTEFF POS: " + clause);
            }

            if (getNegEffects.size() > 0) {
                final List<Integer> clause = new ArrayList<>();
                // pour chaque prédicat on ajoute une clause qui dit que soit le prédicat sera vrai à l'étape suivante 
                // soit une des actions qui a un effet négatif sur ce prédicat est réalisée
                // soit le prédicat est faut à l'étape courante  

                clause.add(predicatsMap.get(pair(i + 1, steps + 1)));
                clause.add(-predicatsMap.get(pair(i + 1, steps)));

                for (int j = 0; j < getNegEffects.size(); j++) {
                    clause.add(actionsMap.get(pair(getNegEffects.get(j) + 1, steps)));
                }

                dimacs.add(clause);
                System.out.println("DIMACS_ACTEFF NEG: " + clause);
            }

        }

        System.out.println("\nDIMACS_ACTEFF: " + dimacs.size());


        // goals:
        BitVector goalsPos = problem.getGoal().getPositiveFluents();
        System.out.println("Goals: " + goalsPos);

        
        // pour chaque prédicat qui est à vrai dans le but on ajoute une clause à la liste des clauses
        for (int i = 0; i < problem.getFluents().size(); i++) {
            if (goalsPos.get(i)) {
                final List<Integer> clause = new ArrayList<>();
                clause.add(predicatsMap.get(pair(i + 1, steps+1)));
                goalsIndex.add(clause);
                dimacs.add(clause);

                System.out.println("DIMACS_GOALS: " + clause);
            }
        }

        System.out.println("DIMACS_GOALS: " + dimacs);

        System.out.println("DIMACS: " + dimacs.size());
    }

    public Plan solve() {
        try {
            ISolver solver = SolverFactory.newDefault();
            // pour chaque clause de la liste des clauses transforme la liste en tableau d'entiers
            // et ajoute la clause au solver
            for (List<Integer> clause : dimacs) {
                int[] clauseArray = new int[clause.size()];
                for (int i = 0; i < clause.size(); i++) {
                    clauseArray[i] = clause.get(i);
                }
                solver.addClause(new VecInt(clauseArray));
                System.out.println("add clause: " + clause);
            }

            // si le solver trouve une solution on récupère le plan
            if (solver.isSatisfiable()) {
                System.out.println("Satisfiable en " + (steps+1) + " steps !");

                Plan plan = new SequentialPlan();
                int[] model = solver.model();

                for (int i = 0; i < model.length; i++) {
                    for (int key : actionsMap.keySet()) {
                        if (actionsMap.get(key) == model[i]) {
                            int step = unpair(key)[1]-1;
                            int action = unpair(key)[0];
                            plan.add(step, problem.getActions().get(action-1));
                        }
                    }
                }

                return plan;
                
            } else {
                System.out.println("Unsatisfiable !");
            }

        } catch (Exception e) {
            // e.printStackTrace();
            // System.out.println("Error solving SAT");
        }

        
        return null;
    }

    /*
     * SAT encoding for next step
     */
    public List next() {
        return null;
    }

    private static int pair(int num, int step) {
        return (int) (0.5 * (num + step) * (num + step + 1) + step);

    }

    private static int[] unpair(int c) {
        int[] res = new int[2];
        int t = (int) Math.floor((-1 + Math.sqrt(1 + 8 * c)) / 2);
        int x = t * (t + 1) / 2;
        res[1] = c - x;
        res[0] = t - res[1];
        return res;
    }

}