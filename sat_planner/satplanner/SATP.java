package satplanner;

import fr.uga.pddl4j.heuristics.state.StateHeuristic;
import fr.uga.pddl4j.parser.DefaultParsedProblem;
import fr.uga.pddl4j.parser.RequireKey;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.planners.AbstractPlanner;
import fr.uga.pddl4j.planners.Planner;
import fr.uga.pddl4j.planners.PlannerConfiguration;
import fr.uga.pddl4j.planners.ProblemNotSupportedException;
import fr.uga.pddl4j.planners.SearchStrategy;
import fr.uga.pddl4j.planners.statespace.search.StateSpaceSearch;
import fr.uga.pddl4j.problem.DefaultProblem;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.State;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.problem.operator.ConditionalEffect;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import satplanner.SATEncoding;

import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Set;

import java.io.BufferedWriter;
import java.io.FileWriter;

/**
 * The class is an example. It shows how to create a simple A* search planner able to
 * solve an ADL problem by choosing the heuristic to used and its weight.
 *
 * @author D. Pellier
 * @version 4.0 - 30.11.2021
 */
@CommandLine.Command(name = "ASP",
    version = "ASP 1.0",
    description = "Solves a specified planning problem using A* search strategy.",
    sortOptions = false,
    mixinStandardHelpOptions = true,
    headerHeading = "Usage:%n",
    synopsisHeading = "%n",
    descriptionHeading = "%nDescription:%n%n",
    parameterListHeading = "%nParameters:%n",
    optionListHeading = "%nOptions:%n")


public class SATP extends AbstractPlanner {

    /**
     * The class logger.
     */
    private static final Logger LOGGER = LogManager.getLogger(SATP.class.getName());

    private String problemName;

    @CommandLine.Option(names = {"--name"}, description = "Set the name of the problem.")
    public void setProblemName(String name) {
        this.problemName = name;
    }
    

    /**
     * Instantiates the planning problem from a parsed problem.
     *
     * @param problem the problem to instantiate.
     * @return the instantiated planning problem or null if the problem cannot be instantiated.
     */
    @Override
    public Problem instantiate(DefaultParsedProblem problem) {
        final Problem pb = new DefaultProblem(problem);
        pb.instantiate();
        return pb;
    }

    /**
     * Search a solution plan to a specified domain and problem using A*.
     *
     * @param problem the problem to solve.
     * @return the plan found or null if no plan was found.
     */
    @Override
    public Plan solve(final Problem problem) {
        long startTime = System.nanoTime();
        int steps = 0;  
        Plan plan = null;

        SATEncoding encoding = new SATEncoding(problem, steps);
        
        while (plan == null) {
            if (steps != 0){
                encoding.encode(problem, steps);
            }
            plan = encoding.solve();
            System.out.println("Steps: " + steps);
            steps++;
        }
        if (plan != null) {
            try {
                long endTime = System.nanoTime();
                BufferedWriter writer = new BufferedWriter(new FileWriter("satp.out", true));
                // writer.write(plan.makespan() + " " + this.getStatistics().getTimeToSearch() + " " + problemName + "\n");
                double time = (endTime - startTime) / 1_000_000_000.0;
                writer.write(plan.makespan() + " " + time + " " + problemName + "\n");
                writer.close();
            } catch (Exception e) {
                System.out.println("Error writing to file");
                e.printStackTrace();
            }
        }
        return plan;
        
    }

    @Override
    public boolean isSupported(Problem problem){
        return true;
    }

    /**
     * The main method of the <code>ASP</code> planner.
     *
     * @param args the arguments of the command line.
     */
    public static void main(String[] args) {
        // A COMMENTER POUR DEBUGGER
        System.setOut(new java.io.PrintStream(new java.io.OutputStream() {
            @Override public void write(int b) {}
        }));
        try {
            final SATP planner = new SATP();
            
            CommandLine cmd = new CommandLine(planner);
            cmd.execute(args);
        } catch (IllegalArgumentException e) {
            LOGGER.fatal(e.getMessage());
        }
    }
    
}
