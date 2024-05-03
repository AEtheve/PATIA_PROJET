(define (domain Sokoban)
(:requirements :strips :typing)

(:types bloc case joueur)
(:predicates (on_j ?j - joueur ?c - case) ; le joueur j est sur la case c
            (on_b ?b - bloc ?c - case) ; le bloc b est sur la case c
            (Libre ?c - case) ; la case c est libre
            (Gauche ?c1 ?c2 - case) ; c1 est à gauche de c2
            (Droite ?c1 ?c2 - case) ; c1 est à droite de c2
            (Haut ?c1 ?c2 - case)   ; c1 est au dessus de c2
            (Bas ?c1 ?c2 - case)   ; c1 est en dessous de c2    


)
(:action PousseG
    :parameters (?b - bloc ?c1 ?c2 ?c3 - case ?j - joueur)
    :precondition (and (Libre c3) (Droite c1 c2) (on_b b c2) (on_j j c1) (Gauche c3 c2))
    :effect (and (not (Libre c3)) (Libre c1) (on_b b c3) (not (on_b b c2)) (on_j j c2) (not (on_j j c1)))
)
(:action PousseD
    :parameters (?b - bloc ?c1 ?c2 ?c3 - case ?j - joueur)
    :precondition (and (Libre c1) (Gauche c2 c1) (on_b b c2) (on_j j c3) (Droite c2 c3))
    :effect (and (not (Libre c1)) (Libre c2) (on_b b c1) (not (on_b b c2)) (on_j j c2) (not (on_j j c3)))
)
)