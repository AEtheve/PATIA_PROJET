;;
;; PDDL file for the AIPS2000 Planning Competition
;; based on the data generated by the airport simulator Astras.
;;

;; Author: Sebastian Trueg thisshouldbethecurrentdateandtime :(
;; Created with AdlDomainExporter 0.1 by Sebastian Trueg <trueg@informatik.uni-freiburg.de>
;;


(define (domain airport_durative)

(:requirements :durative-actions :adl :numeric-fluents)

(:types airplane segment direction airplanetype)

(:constants
      ;; the segments (302)
      seg_W1_C1a_0_60
      seg_W1_C1b_0_60
      seg_W1_C1c_0_34
      seg_N1_0_108
      seg_C1_n2c_0_60
      seg_W1_141a_0_34
      seg_W1_141b_0_45
      seg_W1_141c_0_34
      seg_p141_0_75
      seg_W1_142a_0_34
      seg_W1_142b_0_45
      seg_W1_142c_0_34
      seg_p142_0_75
      seg_W1_143a_0_34
      seg_W1_143b_0_45
      seg_W1_143c_0_60
      seg_p143_0_75
      seg_W1_C2a_0_60
      seg_W1_C2b_0_60
      seg_W1_C2c_0_34
      seg_C2_a_0_80
      seg_W1_151a_0_34
      seg_W1_151b_0_45
      seg_W1_151c_0_34
      seg_p151_0_75
      seg_W1_152a_0_34
      seg_W1_152b_0_45
      seg_W1_152c_0_34
      seg_p152_0_75
      seg_W1_153a_0_34
      seg_W1_153b_0_45
      seg_W1_153c_0_34
      seg_p153_0_75
      seg_W1_154a_0_34
      seg_W1_154b_0_45
      seg_W1_154c_0_34
      seg_p154_0_75
      seg_W1_C3a_0_34
      seg_W1_C3b_0_60
      seg_W1_C3c_0_48
      seg_C3_a_0_80
      seg_W1_161a_0_34
      seg_W1_161b_0_45
      seg_W1_161c_0_34
      seg_p161_0_75
      seg_W1_162a_0_34
      seg_W1_162b_0_45
      seg_W1_162c_0_34
      seg_p162_0_75
      seg_W1_163a_0_34
      seg_W1_163b_0_45
      seg_W1_163c_0_34
      seg_p163_0_75
      seg_W1_164a_0_34
      seg_W1_164b_0_45
      seg_W1_164c_0_34
      seg_p164_0_75
      seg_W1_C4a_0_34
      seg_W1_C4b_0_60
      seg_C4_S6c_0_60
      seg_O1_C1a_0_60
      seg_O1_C1b_0_34
      seg_O1_C1c_0_80
      seg_p101_0_76
      seg_O1_102a_0_34
      seg_C1_n2b_0_80
      seg_O1_102b_0_60
      seg_O1_102c_0_34
      seg_p102_0_76
      seg_O1_103a_0_34
      seg_O1_103b_0_60
      seg_O1_103c_0_34
      seg_p103_0_76
      seg_O1_104a_0_34
      seg_O1_104b_0_60
      seg_O1_104c_0_60
      seg_p104_0_76
      seg_O1_C2a_0_60
      seg_O1_C2b_0_60
      seg_O1_C2c_0_34
      seg_O1_C2d_0_60
      seg_p107_0_76
      seg_O1_108a_0_34
      seg_C2_b_0_80
      seg_O1_108b_0_60
      seg_O1_108c_0_34
      seg_O1_108d_0_45
      seg_p108_0_76
      seg_O1_109a_0_34
      seg_p131_0_75
      seg_O1_109b_0_60
      seg_O1_109c_0_34
      seg_O1_109d_0_45
      seg_p109_0_76
      seg_O1_110a_0_34
      seg_p132_0_75
      seg_O1_110b_0_60
      seg_O1_110c_0_34
      seg_O1_110d_0_45
      seg_p110_0_76
      seg_O1_111a_0_34
      seg_p133_0_75
      seg_O1_111b_0_60
      seg_O1_111c_0_34
      seg_O1_111d_0_45
      seg_p111_0_76
      seg_p134_0_75
      seg_O1_C3a_0_34
      seg_O1_C3b_0_60
      seg_O1_C3c_0_48
      seg_O1_C3d_0_60
      seg_p112_0_76
      seg_O1_115a_0_34
      seg_C3_b_0_80
      seg_O1_115b_0_60
      seg_O1_115c_0_34
      seg_p115_0_76
      seg_O1_116a_0_34
      seg_O1_116b_0_60
      seg_O1_116c_0_34
      seg_p116_0_76
      seg_O1_117a_0_34
      seg_O1_117b_0_60
      seg_O1_117c_0_34
      seg_p117_0_76
      seg_O1_118a_0_34
      seg_O1_118b_0_60
      seg_O1_118c_0_34
      seg_p118_0_76
      seg_O1_C4a_0_34
      seg_O1_C4b_0_60
      seg_O1_C4c_0_80
      seg_p119_0_76
      seg_C4_S6a_0_80
      seg_C1_n2a_0_60
      seg_N2_0_108
      seg_08L_A2a_0_80
      seg_08L_A2b_0_80
      seg_08L_A2A3_0_970
      seg_A2_a_0_90
      seg_08L_A3a_0_80
      seg_08L_A3b_0_161_245
      seg_08l_0_80
      seg_08L_A3A4_0_450
      seg_A3_a_0_158_647
      seg_08L_A4a_0_80
      seg_08L_A4b_0_161_245
      seg_08L_A4c_0_161_245
      seg_08L_A4d_0_80
      seg_08L_A6A7_0_450
      seg_A6_a_0_158_647
      seg_A4_a_0_157_785
      seg_08L_A7a_0_80
      seg_08L_A7b_0_161_245
      seg_08L_A7c_0_161_245
      seg_08L_A7d_0_80
      seg_08L_A7A9_0_270
      seg_A8_a_0_157_785
      seg_A7_a_0_156_924
      seg_09l_0_80
      seg_08L_A9b_0_161_245
      seg_08L_A9c_0_80
      seg_08L_A9A10_0_1010
      seg_A9_a_0_158_647
      seg_08L_A10a_0_80
      seg_08L_A10b_0_80
      seg_A10_1_0_80
      seg_M_A3a_0_120_934
      seg_M_A3b_0_60
      seg_M_A3c_0_60
      seg_A3_b_0_159_512
      seg_M_A3A4a_0_75
      seg_N_A3a_0_60
      seg_M_A3A4b_0_75
      seg_M_A3A4c_0_75
      seg_M_A3A4d_0_75
      seg_M_A3A4e_0_75
      seg_M_A3A4f_0_115
      seg_M_A4a_0_120_934
      seg_M_A4b_0_60
      seg_M_A4c_0_60
      seg_M_A4d_0_60
      seg_A4_b_0_79_7559
      seg_M_A4A7a_0_75
      seg_N_A4a_0_60
      seg_M_A4A7b_0_75
      seg_M_A4A7c_0_75
      seg_M_A4A7d_0_75
      seg_M_A4A7e_0_75
      seg_M_A4A7f_0_115
      seg_M_A7a_0_120_934
      seg_M_A7b_0_60
      seg_M_A7c_0_60
      seg_M_A7d_0_60
      seg_A7_b_0_80_6226
      seg_M_A7A6a_0_75
      seg_N_A7a_0_60
      seg_M_A7A6b_0_75
      seg_M_A7A6c_0_75
      seg_M_A7A6d_0_85
      seg_M_A6a_0_60
      seg_M_A6b_0_60
      seg_M_A6c_0_60
      seg_M_A6d_0_120_934
      seg_M_A6A8a_0_75
      seg_N_A6a_0_60
      seg_A6_b_0_159_512
      seg_M_A6A8b_0_75
      seg_M_A6A8c_0_75
      seg_M_A6A8d_0_75
      seg_M_A6A8e_0_75
      seg_M_A6A8f_0_115
      seg_M_A8a_0_60
      seg_M_A8b_0_60
      seg_M_A8c_0_60
      seg_M_A8d_0_120_934
      seg_M_A8A9a_0_75
      seg_N_A8a_0_60
      seg_A8_b_0_80_6226
      seg_M_A8A9b_0_75
      seg_M_A8A9c_0_75
      seg_M_A8A9d_0_85
      seg_M_A9a_0_60
      seg_M_A9b_0_60
      seg_M_A9c_0_60
      seg_M_A9d_0_120_934
      seg_M_A9A10a_0_75
      seg_N_A9a_0_60
      seg_A9_b_0_159_512
      seg_M_A9A10b_0_75
      seg_M_A9A10c_0_75
      seg_M_A9A10d_0_75
      seg_M_A9A10e_0_75
      seg_M_A9A10f_0_75
      seg_M_A9A10g_0_80
      seg_M_A10a_0_60
      seg_M_A10b_0_60
      seg_M_A10c_0_60
      seg_A10_0_80
      seg_N_A10a_0_60
      seg_N_A2a_0_60
      seg_N_A2b_0_60
      seg_A2_c_0_100
      seg_N_A2A3a_0_75
      seg_N_A2A3b_0_75
      seg_N_A2A3c_0_75
      seg_N_A2A3d_0_75
      seg_N_A2A3e_0_75
      seg_N_A2A3f_0_115
      seg_N_A3b_0_60
      seg_N_A3c_0_60
      seg_N_A3d_0_60
      seg_N_N2c_0_60
      seg_N_N2a_0_60
      seg_N_N2b_0_60
      seg_N_N2A4a_0_70
      seg_N_N2A4b_0_75
      seg_N_N2A4c_0_75
      seg_N_N2A4d_0_75
      seg_N_N2A4e_0_75
      seg_N_A4b_0_60
      seg_N_A4c_0_60
      seg_N_A4A7a_0_115
      seg_N_A4A7b_0_75
      seg_N_A4A7c_0_75
      seg_N_A4A7d_0_75
      seg_N_A4A7e_0_75
      seg_N_A4A7f_0_75
      seg_N_A7b_0_60
      seg_N_A7c_0_60
      seg_N_A7A6a_0_85
      seg_N_A7A6b_0_75
      seg_N_A7A6c_0_75
      seg_N_A7A6d_0_75
      seg_N_A6b_0_60
      seg_N_A6c_0_60
      seg_N_A6A8a_0_115
      seg_N_A6A8b_0_75
      seg_N_A6A8c_0_75
      seg_N_A6A8d_0_75
      seg_N_A6A8e_0_75
      seg_N_A6A8f_0_75
      seg_N_A8b_0_60
      seg_N_A8c_0_60
      seg_N_A8A9a_0_85
      seg_N_A8A9b_0_75
      seg_N_A8A9c_0_75
      seg_N_A8A9d_0_75
      seg_N_A9b_0_60
      seg_N_A9c_0_60
      seg_N_A9A10a_0_80
      seg_N_A9A10b_0_75
      seg_N_A9A10c_0_75
      seg_N_A9A10d_0_75
      seg_N_A9A10e_0_75
      seg_N_A9A10f_0_75
      seg_N_A9A10g_0_75
      seg_N_A10b_0_60
      seg_A2_b_0_90
      seg_A4_b_1_0_80_6226
      seg_A7_b_1_0_80_6226
      seg_A8_b_1_0_79_7559 - segment

)

(:predicates
                (can-move ?s1 ?s2 - segment ?d - direction)
                (can-pushback ?s1 ?s2 - segment ?d - direction)
                (move-dir ?s1 ?s2 - segment ?d - direction)
                (move-back-dir ?s1 ?s2 - segment ?d - direction)
                (is-blocked ?s1  - segment ?t - airplanetype ?s2 - segment ?d - direction)
                (has-type ?a - airplane ?t - airplanetype)
                (at-segment ?a - airplane ?s - segment)
                (facing ?a - airplane ?d - direction)
                (occupied ?s - segment)
                (blocked ?s - segment ?a - airplane)
                (is-start-runway ?s - segment ?d - direction)
                (airborne ?a - airplane ?s - segment)
                (is-moving ?a - airplane)
                (is-pushing ?a - airplane)
                (is-parked ?a - airplane ?s - segment)
                (idled_0)
                (landing_global)
                (landing_started)
                (start_landing)
                (landed_1)
                (idled_1)
                (landed_2)
                (idled_2)
                (landed_3)
                (idled_3)
                (landed_4)
                (idled_4)
                (landed_last)
                (idled_5)
)


(:functions
                ;; the length of a segment
                (length ?s - segment)

                ;; the number of engines of an airplane
                (engines ?a - airplane)
)
(:durative-action move
 :parameters
     (?a - airplane ?t - airplanetype ?d1 - direction ?s1 ?s2  - segment ?d2 - direction)
 :duration
     (= ?duration (/ (length ?s1) 30))
 :condition
     (and
                (over all (has-type ?a ?t))
                (over all (is-moving ?a))
                (over all (not (= ?s1 ?s2)))
                (at start (facing ?a ?d1))
                (over all (can-move ?s1 ?s2 ?d1))
                (over all (move-dir ?s1 ?s2 ?d2))
                (at start (at-segment ?a ?s1))
                (over all (not 	(exists	(?a1 - airplane)	(and 	(not (= ?a1 ?a))
                							(blocked ?s2 ?a1))))
                )
                (over all	(forall (?s - segment)	(imply 	(and 	(is-blocked ?s ?t ?s2 ?d2)
                							(not (= ?s ?s1)))
                						(not (occupied ?s))
                					)
                		)
                )
                (at start (landing_started))
     )
 :effect
     (and
                (at start (occupied ?s2))
                (at start (blocked ?s2 ?a))
                (at end (not (occupied ?s1)))
                (at end (when 	(not (is-blocked ?s1 ?t ?s2 ?d2))
                		(not (blocked ?s1 ?a)))
                )
                (at end (when 	(not (= ?d1 ?d2))
                		(not (facing ?a ?d1)))
                )
                (at end (not (at-segment ?a ?s1)))
                (at end 	(forall (?s - segment)	(when 	(is-blocked ?s ?t ?s2 ?d2)
                						(blocked ?s ?a)
                					)
                		)
                )
                (at end 	(forall (?s - segment)	(when 	(and	(is-blocked ?s ?t ?s1 ?d1)
                							(not (= ?s ?s2))
                							(not (is-blocked ?s ?t ?s2 ?d2))
                						)
                						(not (blocked ?s ?a))
                					)
                		)
                )
                (at end (at-segment ?a ?s2))
                (at end (when 	(not (= ?d1 ?d2))
                                      (facing ?a ?d2))
                )
     )
)
(:durative-action pushback
 :parameters
     (?a - airplane ?t - airplanetype ?d1 - direction ?s1 ?s2  - segment ?d2 - direction)
 :duration
     (= ?duration (/ (length ?s1) 5))
 :condition
     (and
                (over all (has-type ?a ?t))
                (over all (is-pushing ?a))
                (over all (not (= ?s1 ?s2)))
                (at start (facing ?a ?d1))
                (over all (can-pushback ?s1 ?s2 ?d1))
                (over all (move-back-dir ?s1 ?s2 ?d2))
                (at start (at-segment ?a ?s1))
                (over all	(not 	(exists	(?a1 - airplane)	(and 	(not (= ?a1 ?a))
                							(blocked ?s2 ?a1)))
                		)
                )
                (over all 	(forall (?s - segment)	(imply 	(and 	(is-blocked ?s ?t ?s2 ?d2)
                							(not (= ?s ?s1)))
                						(not (occupied ?s))
                					)
                		)
                )
                (at start (landing_started))
     )
 :effect
     (and
                (at start (occupied ?s2))
                (at start (blocked ?s2 ?a))
                (at end	(forall (?s - segment)	(when 	(is-blocked ?s ?t ?s2 ?d2)
                					(blocked ?s ?a)
                				)
                	)
                )
                (at end	(forall (?s - segment)	(when 	(and	(is-blocked ?s ?t ?s1 ?d1)
                						(not (= ?s ?s2))
                						(not (is-blocked ?s ?t ?s2 ?d2))
                                				)
                					        (not (blocked ?s ?a))
                				        )
                	        )
                )
                (at end (at-segment ?a ?s2))
                (at end (when 	(not (= ?d1 ?d2))
                		        (facing ?a ?d2))
                )
                (at end (not (occupied ?s1)))
                (at end (when 	(not (is-blocked ?s1 ?t ?s2 ?d2))
                		(not (blocked ?s1 ?a)))
                )
                (at end (when 	(not (= ?d1 ?d2))
                		(not (facing ?a ?d1)))
                )
                (at end (not (at-segment ?a ?s1)))
     )
)
(:durative-action takeoff
 :parameters (?a - airplane ?s - segment ?d - direction)
 :duration   (= ?duration 30)
 :condition
     (and
                (at start (at-segment ?a ?s))
                (at start (facing ?a ?d))
                (over all (is-start-runway ?s ?d))
                (at start (landing_started))
     )
 :effect
     (and
                (at end (not (blocked ?s ?a)))
	          (at end (not (occupied ?s)))
	          (at end (not (at-segment ?a ?s)))
	          (at end (airborne ?a ?s))
	          (at end (forall (?s1 - segment)	(when   (blocked ?s1 ?a)
                               		                (not (blocked ?s1 ?a))
                             	                        )
		          )
                )
     )
)
(:durative-action park
 :parameters (?a - airplane ?t - airplanetype ?s - segment ?d - direction)
 :duration (= ?duration 40)
 :condition (and    (over all (at-segment ?a ?s))
                    (over all (facing ?a ?d))
                    (at start (is-moving ?a))
            )
 :effect (and (at end (is-parked ?a ?s))
              (at end (not (is-moving ?a)))
		(at end (forall (?ss - segment)	(when 	(and	(is-blocked ?ss ?t ?s ?d)
						        (not (= ?s ?ss))
					                )
					        (not (blocked ?ss ?a))
				                )
              ))
         )
)
(:durative-action startup
 :parameters (?a - airplane)
 :duration  (= ?duration (* 60 (engines ?a) ) )
 :condition
     (and
                (at start (is-pushing ?a))
                (at start (landing_started))
     )
 :effect
     (and
                (at end (not (is-pushing ?a)))
	          (at end (is-moving ?a))
     )
)

(:durative-action idle_1
 :parameters ()
 :duration (= ?duration 124)
 :condition (and
                 (over all (idled_0))
                 (over all (landing_global))
            )
 :effect    (and
                 (at end (idled_1))
                 (at end (not (idled_0)))
            )
)
(:durative-action land_1
 :parameters ()
 :duration (= ?duration 30)
 :condition (and
                 (over all (idled_1))
                 (over all (landing_global))
            )
 :effect    (and
                (at end (landed_1))
                (at end (not (idled_1)))
                (at start (occupied seg_08L_A10b_0_80))
                (at end (not (occupied seg_08L_A10b_0_80)))
                (at start (occupied seg_08L_A9A10_0_1010))
                (at end (not (occupied seg_08L_A9A10_0_1010)))
                (at start (occupied seg_09l_0_80))
                (at end (not (occupied seg_09l_0_80)))
                (at start (occupied seg_08L_A9c_0_80))
                (at end (not (occupied seg_08L_A9c_0_80)))
                (at start (occupied seg_08L_A7A9_0_270))
                (at end (not (occupied seg_08L_A7A9_0_270)))
                (at start (occupied seg_08L_A7a_0_80))
                (at end (not (occupied seg_08L_A7a_0_80)))
                (at start (occupied seg_08L_A7d_0_80))
                (at end (not (occupied seg_08L_A7d_0_80)))
                (at start (occupied seg_08L_A6A7_0_450))
                (at end (not (occupied seg_08L_A6A7_0_450)))
                (at start (occupied seg_08L_A4a_0_80))
                (at end (not (occupied seg_08L_A4a_0_80)))
                (at start (occupied seg_08L_A4d_0_80))
                (at end (not (occupied seg_08L_A4d_0_80)))
                (at start (occupied seg_08L_A3A4_0_450))
                (at end (not (occupied seg_08L_A3A4_0_450)))
                (at start (occupied seg_08L_A3a_0_80))
                (at end (not (occupied seg_08L_A3a_0_80)))
                (at start (occupied seg_08l_0_80))
                (at end (not (occupied seg_08l_0_80)))
                (at start (occupied seg_08L_A2A3_0_970))
                (at end (not (occupied seg_08L_A2A3_0_970)))
                (at start (occupied seg_08L_A2a_0_80))
                (at end (not (occupied seg_08L_A2a_0_80)))
            )
)
(:durative-action idle_2
 :parameters ()
 :duration (= ?duration 210)
 :condition (and
                 (over all (landed_1))
                 (over all (landing_global))
            )
 :effect    (and
                 (at end (idled_2))
                 (at end (not (landed_1)))
            )
)
(:durative-action land_2
 :parameters ()
 :duration (= ?duration 30)
 :condition (and
                 (over all (idled_2))
                 (over all (landing_global))
            )
 :effect    (and
                (at end (landed_2))
                (at end (not (idled_2)))
                (at start (occupied seg_08L_A10b_0_80))
                (at end (not (occupied seg_08L_A10b_0_80)))
                (at start (occupied seg_08L_A9A10_0_1010))
                (at end (not (occupied seg_08L_A9A10_0_1010)))
                (at start (occupied seg_09l_0_80))
                (at end (not (occupied seg_09l_0_80)))
                (at start (occupied seg_08L_A9c_0_80))
                (at end (not (occupied seg_08L_A9c_0_80)))
                (at start (occupied seg_08L_A7A9_0_270))
                (at end (not (occupied seg_08L_A7A9_0_270)))
                (at start (occupied seg_08L_A7a_0_80))
                (at end (not (occupied seg_08L_A7a_0_80)))
                (at start (occupied seg_08L_A7d_0_80))
                (at end (not (occupied seg_08L_A7d_0_80)))
                (at start (occupied seg_08L_A6A7_0_450))
                (at end (not (occupied seg_08L_A6A7_0_450)))
                (at start (occupied seg_08L_A4a_0_80))
                (at end (not (occupied seg_08L_A4a_0_80)))
                (at start (occupied seg_08L_A4d_0_80))
                (at end (not (occupied seg_08L_A4d_0_80)))
                (at start (occupied seg_08L_A3A4_0_450))
                (at end (not (occupied seg_08L_A3A4_0_450)))
                (at start (occupied seg_08L_A3a_0_80))
                (at end (not (occupied seg_08L_A3a_0_80)))
                (at start (occupied seg_08l_0_80))
                (at end (not (occupied seg_08l_0_80)))
                (at start (occupied seg_08L_A2A3_0_970))
                (at end (not (occupied seg_08L_A2A3_0_970)))
                (at start (occupied seg_08L_A2a_0_80))
                (at end (not (occupied seg_08L_A2a_0_80)))
            )
)
(:durative-action idle_3
 :parameters ()
 :duration (= ?duration 150)
 :condition (and
                 (over all (landed_2))
                 (over all (landing_global))
            )
 :effect    (and
                 (at end (idled_3))
                 (at end (not (landed_2)))
            )
)
(:durative-action land_3
 :parameters ()
 :duration (= ?duration 30)
 :condition (and
                 (over all (idled_3))
                 (over all (landing_global))
            )
 :effect    (and
                (at end (landed_3))
                (at end (not (idled_3)))
                (at start (occupied seg_08L_A10b_0_80))
                (at end (not (occupied seg_08L_A10b_0_80)))
                (at start (occupied seg_08L_A9A10_0_1010))
                (at end (not (occupied seg_08L_A9A10_0_1010)))
                (at start (occupied seg_09l_0_80))
                (at end (not (occupied seg_09l_0_80)))
                (at start (occupied seg_08L_A9c_0_80))
                (at end (not (occupied seg_08L_A9c_0_80)))
                (at start (occupied seg_08L_A7A9_0_270))
                (at end (not (occupied seg_08L_A7A9_0_270)))
                (at start (occupied seg_08L_A7a_0_80))
                (at end (not (occupied seg_08L_A7a_0_80)))
                (at start (occupied seg_08L_A7d_0_80))
                (at end (not (occupied seg_08L_A7d_0_80)))
                (at start (occupied seg_08L_A6A7_0_450))
                (at end (not (occupied seg_08L_A6A7_0_450)))
                (at start (occupied seg_08L_A4a_0_80))
                (at end (not (occupied seg_08L_A4a_0_80)))
                (at start (occupied seg_08L_A4d_0_80))
                (at end (not (occupied seg_08L_A4d_0_80)))
                (at start (occupied seg_08L_A3A4_0_450))
                (at end (not (occupied seg_08L_A3A4_0_450)))
                (at start (occupied seg_08L_A3a_0_80))
                (at end (not (occupied seg_08L_A3a_0_80)))
                (at start (occupied seg_08l_0_80))
                (at end (not (occupied seg_08l_0_80)))
                (at start (occupied seg_08L_A2A3_0_970))
                (at end (not (occupied seg_08L_A2A3_0_970)))
                (at start (occupied seg_08L_A2a_0_80))
                (at end (not (occupied seg_08L_A2a_0_80)))
            )
)
(:durative-action idle_4
 :parameters ()
 :duration (= ?duration 90)
 :condition (and
                 (over all (landed_3))
                 (over all (landing_global))
            )
 :effect    (and
                 (at end (idled_4))
                 (at end (not (landed_3)))
            )
)
(:durative-action land_4
 :parameters ()
 :duration (= ?duration 30)
 :condition (and
                 (over all (idled_4))
                 (over all (landing_global))
            )
 :effect    (and
                (at end (landed_4))
                (at end (not (idled_4)))
                (at start (occupied seg_08L_A10b_0_80))
                (at end (not (occupied seg_08L_A10b_0_80)))
                (at start (occupied seg_08L_A9A10_0_1010))
                (at end (not (occupied seg_08L_A9A10_0_1010)))
                (at start (occupied seg_09l_0_80))
                (at end (not (occupied seg_09l_0_80)))
                (at start (occupied seg_08L_A9c_0_80))
                (at end (not (occupied seg_08L_A9c_0_80)))
                (at start (occupied seg_08L_A7A9_0_270))
                (at end (not (occupied seg_08L_A7A9_0_270)))
                (at start (occupied seg_08L_A7a_0_80))
                (at end (not (occupied seg_08L_A7a_0_80)))
                (at start (occupied seg_08L_A7d_0_80))
                (at end (not (occupied seg_08L_A7d_0_80)))
                (at start (occupied seg_08L_A6A7_0_450))
                (at end (not (occupied seg_08L_A6A7_0_450)))
                (at start (occupied seg_08L_A4a_0_80))
                (at end (not (occupied seg_08L_A4a_0_80)))
                (at start (occupied seg_08L_A4d_0_80))
                (at end (not (occupied seg_08L_A4d_0_80)))
                (at start (occupied seg_08L_A3A4_0_450))
                (at end (not (occupied seg_08L_A3A4_0_450)))
                (at start (occupied seg_08L_A3a_0_80))
                (at end (not (occupied seg_08L_A3a_0_80)))
                (at start (occupied seg_08l_0_80))
                (at end (not (occupied seg_08l_0_80)))
                (at start (occupied seg_08L_A2A3_0_970))
                (at end (not (occupied seg_08L_A2A3_0_970)))
                (at start (occupied seg_08L_A2a_0_80))
                (at end (not (occupied seg_08L_A2a_0_80)))
            )
)
(:durative-action idle_5
 :parameters ()
 :duration (= ?duration 150)
 :condition (and
                 (over all (landed_4))
                 (over all (landing_global))
            )
 :effect    (and
                 (at end (idled_5))
                 (at end (not (landed_4)))
            )
)
(:durative-action land_5
 :parameters ()
 :duration (= ?duration 30)
 :condition (and
                 (over all (idled_5))
                 (over all (landing_global))
            )
 :effect    (and
                (at end (landed_last))
                (at end (not (idled_5)))
                (at start (occupied seg_08L_A10b_0_80))
                (at end (not (occupied seg_08L_A10b_0_80)))
                (at start (occupied seg_08L_A9A10_0_1010))
                (at end (not (occupied seg_08L_A9A10_0_1010)))
                (at start (occupied seg_09l_0_80))
                (at end (not (occupied seg_09l_0_80)))
                (at start (occupied seg_08L_A9c_0_80))
                (at end (not (occupied seg_08L_A9c_0_80)))
                (at start (occupied seg_08L_A7A9_0_270))
                (at end (not (occupied seg_08L_A7A9_0_270)))
                (at start (occupied seg_08L_A7a_0_80))
                (at end (not (occupied seg_08L_A7a_0_80)))
                (at start (occupied seg_08L_A7d_0_80))
                (at end (not (occupied seg_08L_A7d_0_80)))
                (at start (occupied seg_08L_A6A7_0_450))
                (at end (not (occupied seg_08L_A6A7_0_450)))
                (at start (occupied seg_08L_A4a_0_80))
                (at end (not (occupied seg_08L_A4a_0_80)))
                (at start (occupied seg_08L_A4d_0_80))
                (at end (not (occupied seg_08L_A4d_0_80)))
                (at start (occupied seg_08L_A3A4_0_450))
                (at end (not (occupied seg_08L_A3A4_0_450)))
                (at start (occupied seg_08L_A3a_0_80))
                (at end (not (occupied seg_08L_A3a_0_80)))
                (at start (occupied seg_08l_0_80))
                (at end (not (occupied seg_08l_0_80)))
                (at start (occupied seg_08L_A2A3_0_970))
                (at end (not (occupied seg_08L_A2A3_0_970)))
                (at start (occupied seg_08L_A2a_0_80))
                (at end (not (occupied seg_08L_A2a_0_80)))
            )
)
(:durative-action landing_wrapper
 :parameters ()
 :duration (= ?duration 874)
 :condition (and
               (at start (start_landing))
            )
 :effect    (and
                 (at start (not (start_landing)))
                 (at start (landing_started))
                 (at start (idled_0))
                 (at start (landing_global))
                 (at end (not (landing_global)))
            )
)

)
