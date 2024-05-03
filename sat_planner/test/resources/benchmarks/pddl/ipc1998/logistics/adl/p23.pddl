(define (problem log-x-23)
   (:domain logistics-adl)
   (:objects package21 package20 package19 package18 package17
             package16 package15 package14 package13 package12 package11
             package10 package9 package8 package7 package6 package5 package4
             package3 package2 package1 - obj
             city8 city7 city6 city5 city4 city3 city2 city1 - city
             truck28 truck27 truck26 truck25 truck24 truck23 truck22
             truck21 truck20 truck19 truck18 truck17 truck16 truck15
             truck14 truck13 truck12 truck11 truck10 truck9 truck8 truck7
             truck6 truck5 truck4 truck3 truck2 truck1 - truck
             plane4 plane3 plane2 plane1 - airplane
             city8-1 city7-1 city6-1 city5-1 city4-1 city3-1 city2-1
             city1-1 - location
             city8-2 city7-2 city6-2 city5-2 city4-2 city3-2 city2-2
             city1-2 - airport)
   (:init (in-city city8-2 city8)
          (in-city city8-1 city8)
          (in-city city7-2 city7)
          (in-city city7-1 city7)
          (in-city city6-2 city6)
          (in-city city6-1 city6)
          (in-city city5-2 city5)
          (in-city city5-1 city5)
          (in-city city4-2 city4)
          (in-city city4-1 city4)
          (in-city city3-2 city3)
          (in-city city3-1 city3)
          (in-city city2-2 city2)
          (in-city city2-1 city2)
          (in-city city1-2 city1)
          (in-city city1-1 city1)
          (at plane4 city5-2)
          (at plane3 city7-2)
          (at plane2 city3-2)
          (at plane1 city1-2)
          (at truck28 city8-1)
          (at truck27 city7-1)
          (at truck26 city6-1)
          (at truck25 city5-1)
          (at truck24 city4-1)
          (at truck23 city3-1)
          (at truck22 city2-1)
          (at truck21 city1-1)
          (at truck20 city2-2)
          (at truck19 city1-1)
          (at truck18 city2-1)
          (at truck17 city7-1)
          (at truck16 city2-2)
          (at truck15 city3-1)
          (at truck14 city5-2)
          (at truck13 city5-1)
          (at truck12 city5-2)
          (at truck11 city6-2)
          (at truck10 city2-2)
          (at truck9 city2-2)
          (at truck8 city1-1)
          (at truck7 city1-1)
          (at truck6 city4-1)
          (at truck5 city6-2)
          (at truck4 city4-1)
          (at truck3 city4-1)
          (at truck2 city2-1)
          (at truck1 city5-2)
          (at package21 city3-1)
          (at package20 city3-1)
          (at package19 city8-1)
          (at package18 city5-1)
          (at package17 city1-2)
          (at package16 city6-1)
          (at package15 city7-2)
          (at package14 city4-2)
          (at package13 city1-1)
          (at package12 city1-2)
          (at package11 city1-2)
          (at package10 city1-2)
          (at package9 city1-1)
          (at package8 city6-1)
          (at package7 city1-1)
          (at package6 city7-1)
          (at package5 city3-1)
          (at package4 city3-2)
          (at package3 city3-1)
          (at package2 city1-2)
          (at package1 city1-1))
   (:goal (and (at package21 city5-2)
               (at package20 city2-2)
               (at package19 city2-1)
               (at package18 city2-2)
               (at package17 city6-1)
               (at package16 city1-1)
               (at package15 city3-2)
               (at package14 city3-1)
               (at package13 city6-1)
               (at package12 city8-1)
               (at package11 city1-2)
               (at package10 city4-1)
               (at package9 city7-1)
               (at package8 city2-1)
               (at package7 city3-2)
               (at package6 city2-2)
               (at package5 city8-2)
               (at package4 city8-2)
               (at package3 city1-2)
               (at package2 city6-2)
               (at package1 city8-2))))