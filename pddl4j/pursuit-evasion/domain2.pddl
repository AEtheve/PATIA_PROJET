
(define (domain pursuit-evasion)
(:requirements :strips :typing)
(:types noeud arrete agent) 
(:predicates (agentSur ?a - agent ?n - noeud) ; un agent est sur le noeud s
              (voisin ?n1 ?n2 - noeud) ; les noeuds n1 et n2 sont voisins 
               (different ?a1 ?a2 - agent) ; les agents a1 et a2 sont différents
                (contamine ?e - arrete) ; l'arête e est contaminée
                (estEntre ?n1 ?n2 - noeud ?e - arrete) ; l'arête e est entre les noeuds n1 et n2
                (sortieunique ?n1  - noeud ?e - arrete) ; l'arête e est la seule sortie du noeud n1
                (decontamine ?e - arrete) ; l'arête e est décontaminée
                (visite ?n1 - noeud) ; le noeud n1 est visité

)
(:action move1 ; Déplacement d'un agent d'un nœud à un autre via une arête
    :parameters (?a1 ?a2 - agent ?n1 ?n2 ?n3 - noeud ?e1 - arrete)
    :precondition (and 
    (agentSur ?a1 ?n1) 
    (different ?a1 ?a2)
    (agentSur ?a2 ?n3) 
    (voisin ?n2 ?n3) 
    (estEntre ?n1 ?n2 ?e1))

    :effect (and  
    (agentSur ?a1 ?n2) 
    (not (agentSur ?a1 ?n1))
    (visite ?n2))
)

(:action move2 ; Déplacement d'un agent d'un nœud à un autre via une arête de sortie unique
    :parameters (?a1  - agent ?n1 ?n2 - noeud ?e - arrete) 
    :precondition (and 
    (agentSur ?a1 ?n1) 
    (sortieunique ?n1 ?e)
    (estEntre ?n1 ?n2 ?e))

    :effect (and 
    (agentSur ?a1 ?n2) 
    (not (agentSur ?a1 ?n1))
    (visite ?n2))
)
 
(:action decontamine ; Décontamination d'une arête si les deux nœuds sont visités 
    :parameters (?e - arrete ?n1 ?n2 - noeud)
    :precondition (and 
    (visite ?n1) 
    (visite ?n2)
    (contamine ?e)
    (estEntre ?n1 ?n2 ?e))

    :effect (and 
    (not(contamine ?e))
    (decontamine ?e))
)
)