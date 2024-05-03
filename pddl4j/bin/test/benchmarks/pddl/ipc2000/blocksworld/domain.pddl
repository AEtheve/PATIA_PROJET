;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain BLOCKS)
  (:requirements :strips :typing)
  
  (:types block)  ;; Définit un type 'block' pour les blocs
  (:predicates (on ?x - block ?y - block) ;; Indique que ?x est sur ?y
	       (ontable ?x - block) ;; Indique que ?x est sur la table
	       (clear ?x - block) ;; Indique que rien n'est sur ?x
	       (handempty) ;; Indique que la main est vide
	       (holding ?x - block) ; Indique que la main tiens ?x
	       )

  (:action pick-up ;; Action pour ramasser un bloc
	     :parameters (?x - block) ;; Paramètre ?x représentant le bloc à ramasser
	     :precondition (and (clear ?x) (ontable ?x) (handempty)) ;; Préconditions pour ramasser un bloc
	     :effect
	     (and (not (ontable ?x)) ;; Effets de ramasser un bloc
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x)))

  (:action put-down ;; Action pour poser un bloc
	     :parameters (?x - block) ;; Paramètre ?x représentant le bloc à poser
	     :precondition (holding ?x) ;; Préconditions pour poser un bloc
	     :effect ;; Effets de poser un bloc
	     (and (not (holding ?x))
		   (clear ?x)
		   (handempty)
		   (ontable ?x)))

  (:action stack ;; Action pour empiler un bloc
	     :parameters (?x - block ?y - block) ;; Paramètres ?x et ?y représentant les blocs à empiler
	     :precondition (and (holding ?x) (clear ?y)) ;; Préconditions pour empiler un bloc
	     :effect ;; Effets de empiler un bloc
	     (and (not (holding ?x))
		   (not (clear ?y))
		   (clear ?x)
		   (handempty)
		   (on ?x ?y)))

  (:action unstack ;; Action pour dépiler un bloc
	     :parameters (?x - block ?y - block) ;; Paramètres ?x et ?y représentant les blocs à dépiler
	     :precondition (and (on ?x ?y) (clear ?x) (handempty)) ;; Préconditions pour dépiler un bloc
	     :effect  ;; Effets de dépiler un bloc
	     (and (holding ?x)
		   (clear ?y)
		   (not (clear ?x))
		   (not (handempty))
		   (not (on ?x ?y)))))
