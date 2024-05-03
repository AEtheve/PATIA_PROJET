;Header and description

(define (domain sokoban)
  (:requirements :strips :typing)

  (:types
	case - object
  )

  (:predicates
	(player-on ?c - case)
	(bloc-on ?c - case)
	(libre ?c - case) 
	(voisin-gauche ?c - case ?c2 - case)
	(voisin-haut ?c - case ?c2 - case)
  )

  (:action pousse-gauche 
	:parameters (?c1 - case ?c2 - case ?c3 - case)
	:precondition (and (player-on ?c1) (bloc-on ?c2) (voisin-gauche ?c3 ?c2) (voisin-gauche ?c2 ?c1) (libre ?c3))
	:effect (and (not (player-on ?c1)) (player-on ?c2) (not (bloc-on ?c2)) (bloc-on ?c3) (not (libre ?c3)) (libre ?c2))
  )

  (:action pousse-droite
	:parameters (?c1 - case ?c2 - case ?c3 - case)
	:precondition (and (player-on ?c1) (bloc-on ?c2) (voisin-gauche ?c1 ?c2) (voisin-gauche ?c2 ?c3) (libre ?c3))
	:effect (and (not (player-on ?c1)) (player-on ?c2) (not (bloc-on ?c2)) (bloc-on ?c3) (not (libre ?c3)) (libre ?c2))
  )

  (:action pousse-haut
	:parameters (?c1 - case ?c2 - case ?c3 - case)
	:precondition (and (player-on ?c1) (bloc-on ?c2) (voisin-haut ?c3 ?c2) (voisin-haut ?c2 ?c1) (libre ?c3))
	:effect (and (not (player-on ?c1)) (player-on ?c2) (not (bloc-on ?c2)) (bloc-on ?c3) (not (libre ?c3)) (libre ?c2))
  )

  (:action pousse-bas 
	:parameters (?c1 - case ?c2 - case ?c3 - case)
	:precondition (and (player-on ?c1) (bloc-on ?c2) (voisin-haut ?c1 ?c2) (voisin-haut ?c2 ?c3) (libre ?c3))
	:effect (and (not (player-on ?c1)) (player-on ?c2) (not (bloc-on ?c2)) (bloc-on ?c3) (not (libre ?c3)) (libre ?c2))
  )

  (:action deplacement-gauche
	:parameters (?c1 - case ?c2 - case)
	:precondition (and (player-on ?c1) (voisin-gauche ?c2 ?c1) (libre ?c2))
	:effect (and (not (player-on ?c1)) (player-on ?c2))
  )
  
  (:action deplacement-droite
	:parameters (?c1 - case ?c2 - case)
	:precondition (and (player-on ?c1) (voisin-gauche ?c1 ?c2) (libre ?c2))
	:effect (and (not (player-on ?c1)) (player-on ?c2))
  )

  (:action deplacement-haut
	:parameters (?c1 - case ?c2 - case)
	:precondition (and (player-on ?c1) (voisin-haut ?c2 ?c1) (libre ?c2))
	:effect (and (not (player-on ?c1)) (player-on ?c2))
  )

  (:action deplacement-bas
	:parameters (?c1 - case ?c2 - case)
	:precondition (and (player-on ?c1) (voisin-haut ?c1 ?c2) (libre ?c2))
	:effect (and (not (player-on ?c1)) (player-on ?c2))
  )
  

  
)