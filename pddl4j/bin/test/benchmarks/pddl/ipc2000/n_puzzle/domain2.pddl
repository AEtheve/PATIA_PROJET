(define (domain n_puzzle)
(:requirements :strips :typing)
(:types piece case)
(:predicates (on ?x - piece ?y - case) ; vérifie position
(canSwitch ?x - case ?y - case)  ; vérifie échangeable entre deux positions
(isFree ?y - case) ; vérifie est case libre
)
(:action move
    :parameters (?x - piece ?src - case ?dest - case)
    :precondition (and (isFree ?dest) (on ?x ?src) (canSwitch ?src ?dest))
    :effect (and (not (isFree ?dest)) (isFree ?src) (on ?x ?dest) (not (on ?x ?src)) (not (canSwitch ?src ?dest)) (canSwitch ?dest ?src))))
