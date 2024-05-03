;Header and description

(define (domain sokoban)
  (:requirements :strips :typing)

  (:types
	case - object ; une case 
  )

  (:predicates
	(player-on ?c - case) ; le joueur est sur la case c
	(bloc-on ?c - case) ; un bloc est sur la case c
	(libre ?c - case) ; case c est libre
	(voisin-gauche ?c - case ?c2 - case) ; c est le voisin gauche de c2
	(voisin-haut ?c - case ?c2 - case) ; c est le voisin haut de c2
  )

  (:action pousse-gauche ; le joueur pousse un bloc vers la gauche
	:parameters (?c1 - case ?c2 - case ?c3 - case)
	:precondition (and 
	(player-on ?c1) 
	(bloc-on ?c2) 
	(voisin-gauche ?c3 ?c2) 
	(voisin-gauche ?c2 ?c1) 
	(libre ?c3))

	:effect (and 
	(not (player-on ?c1)) 
	(player-on ?c2) 
	(not (bloc-on ?c2)) 
	(bloc-on ?c3) (not 
	(libre ?c3)) 
	(libre ?c2))
  )


  (:action pousse-droite ; le joueur pousse un bloc vers la droite
	:parameters (?c1 - case ?c2 - case ?c3 - case)
	:precondition (and 
	(player-on ?c1) 
	(bloc-on ?c2) 
	(voisin-gauche ?c1 ?c2) 
	(voisin-gauche ?c2 ?c3) 
	(libre ?c3))

	:effect (and 
	(not (player-on ?c1)) 
	(player-on ?c2) 
	(not (bloc-on ?c2)) 
	(bloc-on ?c3) 
	(not (libre ?c3)) 
	(libre ?c2))
  )

  (:action pousse-haut ; le joueur pousse un bloc vers le haut
	:parameters (?c1 - case ?c2 - case ?c3 - case)
	:precondition (and 
	(player-on ?c1) 
	(bloc-on ?c2) 
	(voisin-haut ?c3 ?c2) 
	(voisin-haut ?c2 ?c1) 
	(libre ?c3))

	:effect (and 
	(not (player-on ?c1)) 
	(player-on ?c2) 
	(not (bloc-on ?c2)) 
	(bloc-on ?c3) 
	(not (libre ?c3)) 
	(libre ?c2))
  )


  (:action pousse-bas ; le joueur pousse un bloc vers le bas
	:parameters (?c1 - case ?c2 - case ?c3 - case)
	:precondition (and 
	(player-on ?c1) 
	(bloc-on ?c2) 
	(voisin-haut ?c1 ?c2) 
	(voisin-haut ?c2 ?c3) 
	(libre ?c3))

	:effect (and 
	(not (player-on ?c1)) 
	(player-on ?c2) 
	(not (bloc-on ?c2)) 
	(bloc-on ?c3) 
	(not (libre ?c3)) 
	(libre ?c2))
  )

  (:action deplacement-gauche ; le joueur se déplace vers la gauche
	:parameters (?c1 - case ?c2 - case)
	:precondition (and 
	(player-on ?c1) 
	(voisin-gauche ?c2 ?c1) 
	(libre ?c2))

	:effect (and 
	(not (player-on ?c1)) 
	(player-on ?c2))
  )

  
  (:action deplacement-droite ; le joueur se déplace vers la droite
	:parameters (?c1 - case ?c2 - case)
	:precondition (and 
	(player-on ?c1) 
	(voisin-gauche ?c1 ?c2) 
	(libre ?c2))

	:effect (and 
	(not (player-on ?c1)) 
	(player-on ?c2))
  )

  (:action deplacement-haut ; le joueur se déplace vers le haut
	:parameters (?c1 - case ?c2 - case)
	:precondition (and 
	(player-on ?c1) 
	(voisin-haut ?c2 ?c1) 
	(libre ?c2))

	:effect (and 
	(not (player-on ?c1)) 
	(player-on ?c2))
  )

  (:action deplacement-bas ; le joueur se déplace vers le bas
	:parameters (?c1 - case ?c2 - case)
	:precondition (and 
	(player-on ?c1) 
	(voisin-haut ?c1 ?c2) 
	(libre ?c2))

	:effect (and 
	(not (player-on ?c1)) 
	(player-on ?c2))
  )
  
)