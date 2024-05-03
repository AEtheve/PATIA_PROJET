(define (domain coloriage)
    (:requirements :strips :typing)
    (:types noeud arrete color) ;;
    
    (:predicates
        (voisin ?n1 ?n2 - noeud) ;; noeud n1 et n2 sont voisins
        (incolore ?n - noeud) ;; noeud n est incolore
        (colore ?n - noeud) ;; noeud n est colore
        (decouleur ?n - noeud ?c - color) ;; noeud n a la couleur c
        (differentes_couleurs ?c1 ?c2 - color) ;; c1 et c2 sont differentes
        (marquee ?a - arrete) ;; arrete a est marquee
        (entre ?a - arrete ?n1 ?n2 - noeud) ;; l'arrete a est entre les noeuds n1 et n2
    )

    (:action colorier2noeuds ;; colorier 2 noeuds voisins
        :parameters (?n1 ?n2 - noeud ?c1 ?c2 - color)
        :precondition (and 
        (voisin ?n1 ?n2) 
        (incolore ?n1) 
        (incolore ?n2) 
        (differentes_couleurs ?c1 ?c2))

        :effect (and 
        (colore ?n1) 
        (colore ?n2) 
        (not(incolore?n1)) 
        (not(incolore?n2))
        (decouleur ?n1 ?c1) 
        (decouleur ?n2 ?c2))
    )

    (:action colorier1noeud ;; colorier 1 noeud 
        :parameters (?n1 ?n2 - noeud ?c1 ?c2 - color) ;; c1 et c2 sont les couleurs des noeuds n1 et n2
        :precondition (and 
        (voisin ?n1 ?n2) 
        (colore ?n1) 
        (decouleur ?n1 ?c1)
        (incolore ?n2) 
        (differentes_couleurs ?c1 ?c2))

        :effect (and 
        (colore ?n2) 
        (not(incolore?n2)) 
        (decouleur ?n2 ?c2)) 
    )

    (:action marquerarrete ;; marquer une arrete
        :parameters (?n1 ?n2 - noeud ?a - arrete ?c1 ?c2 - color) ;; c1 et c2 sont les couleurs des noeuds n1 et n2
        :precondition (and 
        (voisin ?n1 ?n2) 
        (colore ?n1) 
        (colore ?n2)
        (differentes_couleurs ?c1 ?c2)
        (decouleur ?n1 ?c1)
        (decouleur ?n2 ?c2)
        (entre ?a ?n1 ?n2) )
        
        :effect (marquee ?a)
    )
)
