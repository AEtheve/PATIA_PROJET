(define (problem depotprob1916) (:domain Depot)
(:objects
	depot0 depot1 - Depot
	distributor0 distributor1 - Distributor
	truck0 truck1 truck2 truck3 - Truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 pallet10 pallet11 pallet12 pallet13 pallet14 pallet15 pallet16 pallet17 pallet18 pallet19 pallet20 pallet21 pallet22 pallet23 pallet24 pallet25 pallet26 pallet27 pallet28 pallet29 pallet30 pallet31 pallet32 pallet33 pallet34 pallet35 pallet36 pallet37 pallet38 pallet39 - Pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 crate15 crate16 crate17 crate18 crate19 crate20 crate21 crate22 crate23 crate24 crate25 crate26 crate27 crate28 crate29 crate30 crate31 crate32 crate33 crate34 crate35 crate36 crate37 crate38 crate39 crate40 crate41 crate42 crate43 crate44 crate45 crate46 crate47 crate48 crate49 crate50 crate51 crate52 crate53 crate54 crate55 crate56 crate57 crate58 crate59 crate60 crate61 crate62 crate63 crate64 crate65 crate66 crate67 crate68 crate69 crate70 crate71 crate72 crate73 crate74 crate75 crate76 crate77 crate78 crate79 crate80 crate81 crate82 crate83 crate84 crate85 crate86 crate87 crate88 crate89 crate90 crate91 crate92 crate93 crate94 crate95 crate96 crate97 crate98 crate99 crate100 crate101 crate102 crate103 crate104 crate105 crate106 crate107 crate108 crate109 crate110 crate111 crate112 crate113 crate114 crate115 crate116 crate117 crate118 crate119 - Crate
	hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 - Hoist)
(:init
	(at pallet0 depot0)
	(clear crate100)
	(at pallet1 depot1)
	(clear crate69)
	(at pallet2 distributor0)
	(clear crate53)
	(at pallet3 distributor1)
	(clear crate30)
	(at pallet4 depot0)
	(clear crate21)
	(at pallet5 distributor0)
	(clear crate102)
	(at pallet6 distributor1)
	(clear crate107)
	(at pallet7 depot1)
	(clear crate74)
	(at pallet8 depot0)
	(clear crate106)
	(at pallet9 depot0)
	(clear pallet9)
	(at pallet10 distributor1)
	(clear crate18)
	(at pallet11 depot0)
	(clear crate77)
	(at pallet12 depot1)
	(clear crate93)
	(at pallet13 depot1)
	(clear crate85)
	(at pallet14 depot0)
	(clear crate112)
	(at pallet15 distributor1)
	(clear crate73)
	(at pallet16 depot0)
	(clear crate113)
	(at pallet17 depot0)
	(clear crate90)
	(at pallet18 distributor1)
	(clear pallet18)
	(at pallet19 distributor1)
	(clear crate111)
	(at pallet20 distributor0)
	(clear crate117)
	(at pallet21 distributor0)
	(clear crate91)
	(at pallet22 distributor0)
	(clear crate108)
	(at pallet23 depot0)
	(clear crate99)
	(at pallet24 distributor1)
	(clear crate101)
	(at pallet25 distributor0)
	(clear crate119)
	(at pallet26 depot1)
	(clear crate84)
	(at pallet27 depot1)
	(clear crate61)
	(at pallet28 depot1)
	(clear crate94)
	(at pallet29 depot1)
	(clear crate98)
	(at pallet30 depot0)
	(clear crate59)
	(at pallet31 depot0)
	(clear crate47)
	(at pallet32 distributor1)
	(clear crate104)
	(at pallet33 depot1)
	(clear crate79)
	(at pallet34 depot1)
	(clear pallet34)
	(at pallet35 depot0)
	(clear crate103)
	(at pallet36 distributor1)
	(clear crate116)
	(at pallet37 depot1)
	(clear crate96)
	(at pallet38 depot1)
	(clear crate65)
	(at pallet39 distributor1)
	(clear crate114)
	(at truck0 depot1)
	(at truck1 distributor0)
	(at truck2 depot0)
	(at truck3 depot1)
	(at hoist0 depot0)
	(available hoist0)
	(at hoist1 depot1)
	(available hoist1)
	(at hoist2 distributor0)
	(available hoist2)
	(at hoist3 distributor1)
	(available hoist3)
	(at hoist4 distributor0)
	(available hoist4)
	(at hoist5 depot0)
	(available hoist5)
	(at hoist6 distributor0)
	(available hoist6)
	(at hoist7 distributor1)
	(available hoist7)
	(at crate0 depot0)
	(on crate0 pallet14)
	(at crate1 depot0)
	(on crate1 pallet31)
	(at crate2 distributor0)
	(on crate2 pallet5)
	(at crate3 depot1)
	(on crate3 pallet33)
	(at crate4 distributor0)
	(on crate4 pallet21)
	(at crate5 depot1)
	(on crate5 crate3)
	(at crate6 depot0)
	(on crate6 pallet16)
	(at crate7 distributor0)
	(on crate7 pallet2)
	(at crate8 depot0)
	(on crate8 crate0)
	(at crate9 distributor0)
	(on crate9 pallet20)
	(at crate10 depot1)
	(on crate10 pallet26)
	(at crate11 depot0)
	(on crate11 pallet23)
	(at crate12 distributor1)
	(on crate12 pallet6)
	(at crate13 depot0)
	(on crate13 pallet35)
	(at crate14 depot1)
	(on crate14 pallet1)
	(at crate15 depot1)
	(on crate15 crate5)
	(at crate16 depot1)
	(on crate16 pallet38)
	(at crate17 distributor1)
	(on crate17 pallet3)
	(at crate18 distributor1)
	(on crate18 pallet10)
	(at crate19 depot0)
	(on crate19 crate8)
	(at crate20 depot1)
	(on crate20 crate10)
	(at crate21 depot0)
	(on crate21 pallet4)
	(at crate22 distributor1)
	(on crate22 crate12)
	(at crate23 depot0)
	(on crate23 pallet8)
	(at crate24 depot1)
	(on crate24 pallet28)
	(at crate25 depot0)
	(on crate25 pallet11)
	(at crate26 depot0)
	(on crate26 pallet17)
	(at crate27 distributor1)
	(on crate27 pallet15)
	(at crate28 distributor1)
	(on crate28 pallet19)
	(at crate29 distributor1)
	(on crate29 crate17)
	(at crate30 distributor1)
	(on crate30 crate29)
	(at crate31 depot1)
	(on crate31 pallet37)
	(at crate32 distributor0)
	(on crate32 crate4)
	(at crate33 distributor0)
	(on crate33 crate2)
	(at crate34 depot1)
	(on crate34 crate16)
	(at crate35 distributor0)
	(on crate35 pallet25)
	(at crate36 depot1)
	(on crate36 pallet29)
	(at crate37 depot1)
	(on crate37 pallet27)
	(at crate38 distributor1)
	(on crate38 pallet36)
	(at crate39 distributor1)
	(on crate39 crate27)
	(at crate40 distributor1)
	(on crate40 pallet24)
	(at crate41 distributor1)
	(on crate41 pallet39)
	(at crate42 distributor0)
	(on crate42 pallet22)
	(at crate43 distributor0)
	(on crate43 crate35)
	(at crate44 distributor0)
	(on crate44 crate43)
	(at crate45 depot0)
	(on crate45 crate11)
	(at crate46 depot1)
	(on crate46 crate20)
	(at crate47 depot0)
	(on crate47 crate1)
	(at crate48 distributor0)
	(on crate48 crate42)
	(at crate49 depot1)
	(on crate49 crate14)
	(at crate50 depot0)
	(on crate50 crate26)
	(at crate51 distributor0)
	(on crate51 crate33)
	(at crate52 depot0)
	(on crate52 crate6)
	(at crate53 distributor0)
	(on crate53 crate7)
	(at crate54 depot1)
	(on crate54 crate37)
	(at crate55 depot1)
	(on crate55 crate31)
	(at crate56 distributor0)
	(on crate56 crate51)
	(at crate57 depot1)
	(on crate57 pallet13)
	(at crate58 depot1)
	(on crate58 pallet12)
	(at crate59 depot0)
	(on crate59 pallet30)
	(at crate60 depot1)
	(on crate60 crate24)
	(at crate61 depot1)
	(on crate61 crate54)
	(at crate62 depot0)
	(on crate62 crate13)
	(at crate63 depot0)
	(on crate63 crate45)
	(at crate64 depot0)
	(on crate64 crate52)
	(at crate65 depot1)
	(on crate65 crate34)
	(at crate66 depot0)
	(on crate66 crate25)
	(at crate67 depot1)
	(on crate67 crate49)
	(at crate68 depot0)
	(on crate68 crate62)
	(at crate69 depot1)
	(on crate69 crate67)
	(at crate70 distributor0)
	(on crate70 crate32)
	(at crate71 depot0)
	(on crate71 crate68)
	(at crate72 depot0)
	(on crate72 crate71)
	(at crate73 distributor1)
	(on crate73 crate39)
	(at crate74 depot1)
	(on crate74 pallet7)
	(at crate75 distributor0)
	(on crate75 crate56)
	(at crate76 distributor0)
	(on crate76 crate9)
	(at crate77 depot0)
	(on crate77 crate66)
	(at crate78 depot1)
	(on crate78 crate58)
	(at crate79 depot1)
	(on crate79 crate15)
	(at crate80 distributor0)
	(on crate80 crate76)
	(at crate81 distributor0)
	(on crate81 crate48)
	(at crate82 depot0)
	(on crate82 crate72)
	(at crate83 distributor1)
	(on crate83 crate28)
	(at crate84 depot1)
	(on crate84 crate46)
	(at crate85 depot1)
	(on crate85 crate57)
	(at crate86 distributor1)
	(on crate86 crate83)
	(at crate87 depot0)
	(on crate87 crate82)
	(at crate88 depot0)
	(on crate88 crate50)
	(at crate89 depot0)
	(on crate89 crate63)
	(at crate90 depot0)
	(on crate90 crate88)
	(at crate91 distributor0)
	(on crate91 crate70)
	(at crate92 distributor0)
	(on crate92 crate81)
	(at crate93 depot1)
	(on crate93 crate78)
	(at crate94 depot1)
	(on crate94 crate60)
	(at crate95 depot0)
	(on crate95 crate89)
	(at crate96 depot1)
	(on crate96 crate55)
	(at crate97 depot0)
	(on crate97 pallet0)
	(at crate98 depot1)
	(on crate98 crate36)
	(at crate99 depot0)
	(on crate99 crate95)
	(at crate100 depot0)
	(on crate100 crate97)
	(at crate101 distributor1)
	(on crate101 crate40)
	(at crate102 distributor0)
	(on crate102 crate75)
	(at crate103 depot0)
	(on crate103 crate87)
	(at crate104 distributor1)
	(on crate104 pallet32)
	(at crate105 depot0)
	(on crate105 crate23)
	(at crate106 depot0)
	(on crate106 crate105)
	(at crate107 distributor1)
	(on crate107 crate22)
	(at crate108 distributor0)
	(on crate108 crate92)
	(at crate109 distributor0)
	(on crate109 crate44)
	(at crate110 distributor0)
	(on crate110 crate109)
	(at crate111 distributor1)
	(on crate111 crate86)
	(at crate112 depot0)
	(on crate112 crate19)
	(at crate113 depot0)
	(on crate113 crate64)
	(at crate114 distributor1)
	(on crate114 crate41)
	(at crate115 distributor0)
	(on crate115 crate80)
	(at crate116 distributor1)
	(on crate116 crate38)
	(at crate117 distributor0)
	(on crate117 crate115)
	(at crate118 distributor0)
	(on crate118 crate110)
	(at crate119 distributor0)
	(on crate119 crate118)
)

(:goal (and
		(on crate0 crate21)
		(on crate1 pallet20)
		(on crate2 pallet19)
		(on crate3 crate40)
		(on crate4 pallet13)
		(on crate5 crate29)
		(on crate6 crate24)
		(on crate7 crate16)
		(on crate9 pallet9)
		(on crate10 crate7)
		(on crate11 crate97)
		(on crate12 crate6)
		(on crate13 crate90)
		(on crate14 pallet24)
		(on crate15 crate33)
		(on crate16 crate57)
		(on crate17 pallet16)
		(on crate18 crate49)
		(on crate20 pallet12)
		(on crate21 pallet3)
		(on crate23 crate72)
		(on crate24 crate107)
		(on crate25 pallet1)
		(on crate26 crate93)
		(on crate27 crate102)
		(on crate28 crate56)
		(on crate29 crate18)
		(on crate30 crate17)
		(on crate31 crate91)
		(on crate32 crate76)
		(on crate33 pallet7)
		(on crate34 crate81)
		(on crate35 crate113)
		(on crate36 crate37)
		(on crate37 crate23)
		(on crate38 crate46)
		(on crate40 crate67)
		(on crate41 pallet34)
		(on crate43 pallet10)
		(on crate44 crate1)
		(on crate45 crate14)
		(on crate46 pallet5)
		(on crate49 pallet11)
		(on crate52 crate92)
		(on crate53 pallet36)
		(on crate54 pallet6)
		(on crate55 crate36)
		(on crate56 crate65)
		(on crate57 crate86)
		(on crate60 crate5)
		(on crate61 crate52)
		(on crate62 crate13)
		(on crate63 pallet0)
		(on crate64 pallet14)
		(on crate65 pallet17)
		(on crate66 pallet2)
		(on crate67 pallet39)
		(on crate68 pallet28)
		(on crate69 pallet33)
		(on crate70 crate88)
		(on crate71 pallet22)
		(on crate72 crate85)
		(on crate73 crate106)
		(on crate74 crate118)
		(on crate75 crate0)
		(on crate76 pallet29)
		(on crate77 crate27)
		(on crate78 pallet15)
		(on crate79 crate117)
		(on crate80 pallet18)
		(on crate81 pallet23)
		(on crate82 crate25)
		(on crate83 crate98)
		(on crate84 pallet38)
		(on crate85 crate78)
		(on crate86 crate41)
		(on crate87 crate71)
		(on crate88 crate101)
		(on crate89 crate111)
		(on crate90 crate95)
		(on crate91 crate30)
		(on crate92 crate112)
		(on crate93 crate100)
		(on crate94 crate63)
		(on crate95 pallet32)
		(on crate96 crate79)
		(on crate97 crate75)
		(on crate98 crate32)
		(on crate99 pallet35)
		(on crate100 crate54)
		(on crate101 crate99)
		(on crate102 pallet26)
		(on crate104 crate66)
		(on crate106 crate116)
		(on crate107 crate20)
		(on crate108 crate35)
		(on crate109 pallet31)
		(on crate111 pallet21)
		(on crate112 crate53)
		(on crate113 pallet30)
		(on crate114 crate70)
		(on crate116 pallet25)
		(on crate117 crate15)
		(on crate118 pallet8)
		(on crate119 crate80)
	)
))
