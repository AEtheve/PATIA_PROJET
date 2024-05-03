;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;marche sur le problème créé

(define (domain blocks)
  (:requirements :strips :typing)
  (:types block tower)
  (:predicates (on ?x - block ?y - block)
	       
		   (plusgrand ?x - block ?y - block)
		   (ontower ?x - block ?y - tower)
	       (clear ?x - block)
		   (clear_tower ?y - tower)
	       (handempty)
	       (holding ?x - block)
	       )
;; pick-up permet de prendre un bloc sur une tour 
  (:action pick-up 
	     :parameters (?x - block ?y - tower)
	     :precondition (and (clear ?x) (ontower ?x ?y) (handempty))
	     :effect
	     (and (clear_tower ?y)
		 	(not (clear ?x))
		   (not (handempty))
		   (not (ontower ?x ?y))
		   (holding ?x)))
;; put-down permet de poser un bloc sur une tour
  (:action put-down
	     :parameters (?x - block ?y - tower)
	     :precondition (and (holding ?x) (clear_tower ?y))
	     :effect
	     (and (not (holding ?x))
		   (ontower ?x ?y)
		   (clear ?x)
		   (handempty)
		   (not (clear_tower ?y))
		)
	)
;; stack permet de poser un bloc sur un autre bloc
  (:action stack
	     :parameters (?x - block ?y - block)
	     :precondition (and (holding ?x) (clear ?y) (plusgrand ?y ?x))
	     :effect
	     (and (not (holding ?x))
		   (not (clear ?y))
		   (clear ?x)
		   (handempty)
		   (on ?y ?x)))
;; unstack permet de prendre un bloc sur un autre bloc
  (:action unstack
	     :parameters (?x - block ?y - block)
	     :precondition (and (on ?y ?x) (clear ?x) (handempty))
	     :effect
	     (and (holding ?x)
		   (clear ?y)
		   (not (clear ?x))
		   (not (handempty))
		   (not (on ?y ?x)))))