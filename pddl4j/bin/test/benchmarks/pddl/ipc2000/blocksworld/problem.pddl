(define (problem blocks-4-0)
(:domain blocks)
(:objects a b c d - block tour1 tour2 tour3 - tower)
(:init (ontower d tour1) (plusgrand d c) (plusgrand c b) (plusgrand b a)
(clear a) (handempty) (on c d) (on b c) (on a b))

(:goal (and (on c d) (on b c) (on a b) (ontower d tour3)))
)