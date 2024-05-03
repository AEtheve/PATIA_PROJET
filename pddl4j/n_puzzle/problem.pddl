(define (problem n_puzzle-4-0)
(:domain n_puzzle)
(:objects CASE1 CASE2 CASE3 CASE4 CASE5 CASE6 CASE7 CASE8 CASE9 - case 
          P1 P2 P3 P4 P5 P6 P7 P8 libre - piece) 
          ; CASE1 | CASE2 | CASE3
          ; CASE4 | CASE5 | CASE6
          ; CASE7 | CASE8 | CASE9
          

(:init (on CASE1 P3) 
        (on CASE2 P7) 
        (on CASE3 P5) 
        (on  CASE4 libre)    
        (on  CASE5 P1) 
        (on  CASE6 P2) 
        (on CASE7 P8)  
        (on CASE8 P4) 
        (on  CASE9 P6)

        ;     P3    | P7 | P5        
        ;     libre | P1 | P2
        ;     P8    | P4 | P6

)
(:goal (and (on  CASE1 P1) 
            (on  CASE2 P2) 
            (on  CASE3 P3) 
            (on  CASE4 P4) 
            (on  CASE5 P5) 
            (on  CASE6 P6) 
            (on  CASE7 P7) 
            (on  CASE8 P8) 
            (on  CASE9 libre)

            ;     P1 | P2 | P3
            ;     P4 | P5 | P6
            ;     P7 | P8 | libre
)
))
