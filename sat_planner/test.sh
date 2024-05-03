#!/bin/bash
loader() {
    pid=$1
    message=$2
    spin='-\|/'

    i=0
    time=0
    while kill -0 $pid 2>/dev/null
    do
        i=$(( (i+1) %4 ))
        printf "\r${spin:$i:1} $time $message"
        sleep .1
        time=$((time+1))
        if [ $time -eq 300 ]; then
            printf "\r\033[31mx\033[0m $message\n"
            kill $pid
        fi
    done
    if [ $? -eq 0 ]; then
        printf "\r\033[32m✓\033[0m $message\n"
    else
        printf "\r\033[31mx\033[0m $message\n"
        # exit 1
    fi
}

killall java

javac -d classes -cp lib/pddl4j-4.0.0.jar asp/ASP.java &
loader $! "Compiling ASP"

javac -d classes -cp classes:lib/pddl4j-4.0.0.jar:lib/sat4j-sat.jar:lib/org.sat4j.core.jar satplanner/*.java -Xlint:unchecked &
loader $! "Compiling SAT Planner"


echo "== SAT Planner V.S ASP on blocksword =="
path="test/resources/benchmarks/pddl/ipc2000/blocks/strips-typed"

# file=test/resources/benchmarks/pddl/ipc2000/blocks/strips-typed/p009.pddl
for file in $path/p*.pddl; do
    pname=$(basename $file)
    pname=${pname%.*}
    # java -cp classes:lib/pddl4j-4.0.0.jar fr.uga.pddl4j.examples.asp.ASP $path/domain.pddl $file -t 10 --name $pname > /dev/null &
    # loader $! "Running ASP on $file"

    # java -cp classes:lib/pddl4j-4.0.0.jar:lib/sat4j-sat.jar satplanner.SATP resources/benchmarks/pddl/ipc2000/blocks/strips-typed/domain.pddl resources/benchmarks/pddl/ipc2000/blocks/strips-typed/p003.pddl

    java -cp classes:lib/pddl4j-4.0.0.jar:lib/sat4j-sat.jar satplanner.SATP $path/domain.pddl $file --name $pname > /dev/null &
    loader $! "Running SAT Planner on $file"
done
