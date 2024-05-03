(define (domain pursuit-evasion)
(:requirements :strips :typing)
(:types noeud arrete agent)
(:predicates (agentSur ?a - agent ?n - noeud)
              (voisin ?n1 ?n2 - noeud)
               (different ?a1 ?a2 - agent)
                (contamine ?e - arrete)
                (estEntre ?n1 ?n2 - noeud ?e - arrete)
                (sortieunique ?n1  - noeud ?e - arrete)
                (decontamine ?e - arrete)

)
(:action move1
    :parameters (?a1 ?a2 - agent ?n1 ?n2 ?n3 - noeud ?e1 - arrete)
    :precondition (and (agentSur ?a1 ?n1) (different ?a1 ?a2)(agentSur ?a2 ?n3) (voisin ?n2 ?n3)(estEntre ?n1 ?n2 ?e1))
    :effect (and   (agentSur ?a1 ?n2) (not (agentSur ?a1 ?n1)))
)
(:action move2
    :parameters (?a1  - agent ?n1 ?n2 - noeud ?e - arrete) 
    :precondition (and (agentSur ?a1 ?n1) (sortieunique ?n1 ?e)(estEntre ?n1 ?n2 ?e))
    :effect (and (agentSur ?a1 ?n2) (not (agentSur ?a1 ?n1)))
)

(:action decontamine
    :parameters (?a1 ?a2 - agent ?e - arrete ?n1 ?n2 - noeud)
    :precondition (and (estEntre ?n1 ?n2 ?e) (contamine ?e)(agentSur ?a1 ?n1)(agentSur ?a2 ?n2))
    :effect (and (not(contamine ?e))(decontamine ?e))
)
)
;todo faire en sorte que les agents ne libere pas le passage pour l'intrus
; agent doivent tjr etre sur le meme noeud ou sur des noeuds voisins
