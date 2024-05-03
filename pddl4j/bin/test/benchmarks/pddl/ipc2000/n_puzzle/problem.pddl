(define (problem n_puzzle-4-0)
(:domain n_puzzle)
(:objects CASE1 CASE2 CASE3 CASE4 CASE5 CASE6 CASE7 CASE8 CASE9 - case 
          P1 P2 P3 P4 P5 P6 P7 P8 - piece)

(:init (on P3 CASE1) (on P7 CASE2) (on P5 CASE3) 
        (isFree CASE4)    (on P1 CASE5) (on P2 CASE6) 
        (on P8 CASE7)  (on P4 CASE8) (on P6 CASE9)
        (canSwitch CASE1 CASE4) (canSwitch CASE5 CASE4) (canSwitch CASE7 CASE4)
)
(:goal (and (on P3 CASE1) (on P7 CASE2) (on P5 CASE3) 
            (on P1 CASE4) (on P4 CASE5) (isFree CASE6)
            (on P8 CASE7) (on P6 CASE8) (on P2 CASE9)
)))
