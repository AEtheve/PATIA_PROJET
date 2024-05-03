(define (domain n_puzzle)
  (:requirements :strips :typing)
  (:types piece case) ; les pièces et les cases
  (:constants libre - piece) 
  (:predicates 
        (on ?x - case ?y - piece)  ; x est la case de y
        (echangeable ?x - case ?y - case)) ; x et y sont échangeables

  (:action move ; déplacer une pièce d'une case à une autre
           :parameters (?t - piece ?from - case ?to - case) ; t est la piece à déplacer, from est la case de t, to est la case où t doit être déplacée
           :precondition (and 
           (on ?from ?t) 
           (on ?to libre))

           :effect 
           (and (on ?to ?t) 
           (on ?from libre) 
           (not (on ?from ?t)) 
           (not (on ?to libre)))))