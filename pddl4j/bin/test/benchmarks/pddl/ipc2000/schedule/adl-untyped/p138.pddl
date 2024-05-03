(define (problem schedule-47-2)
(:domain schedule)
(:objects
    A2
    Z1
    W1
    V1
    U1
    S1
    R1
    P1
    Q1
    O1
    N1
    M1
    L1
    K1
    J1
    I1
    H1
    G1
    F1
    E1
    D1
    C1
    B1
    A1
    Z0
    W0
    V0
    U0
    S0
    R0
    P0
    Q0
    O0
    N0
    M0
    L0
    K0
    J0
    I0
    H0
    G0
    F0
    E0
    D0
    C0
    CIRCULAR
    TWO
    THREE
    BLUE
    YELLOW
    BACK
    RED
    B0
    FRONT
    ONE
    BLACK
    OBLONG
    A0
)
(:init
    (SHAPE A0 CIRCULAR)
    (SURFACE-CONDITION A0 SMOOTH)
    (PAINTED A0 BLACK)
    (HAS-HOLE A0 ONE BACK)
    (TEMPERATURE A0 COLD)
    (SHAPE B0 CIRCULAR)
    (SURFACE-CONDITION B0 ROUGH)
    (PAINTED B0 BLACK)
    (HAS-HOLE B0 ONE BACK)
    (TEMPERATURE B0 COLD)
    (SHAPE C0 CIRCULAR)
    (SURFACE-CONDITION C0 SMOOTH)
    (PAINTED C0 BLACK)
    (HAS-HOLE C0 ONE FRONT)
    (TEMPERATURE C0 COLD)
    (SHAPE D0 CIRCULAR)
    (SURFACE-CONDITION D0 SMOOTH)
    (PAINTED D0 RED)
    (HAS-HOLE D0 ONE BACK)
    (TEMPERATURE D0 COLD)
    (SHAPE E0 CIRCULAR)
    (SURFACE-CONDITION E0 POLISHED)
    (PAINTED E0 RED)
    (HAS-HOLE E0 TWO BACK)
    (TEMPERATURE E0 COLD)
    (SHAPE F0 OBLONG)
    (SURFACE-CONDITION F0 ROUGH)
    (PAINTED F0 BLACK)
    (HAS-HOLE F0 THREE BACK)
    (TEMPERATURE F0 COLD)
    (SHAPE G0 CYLINDRICAL)
    (SURFACE-CONDITION G0 POLISHED)
    (PAINTED G0 RED)
    (HAS-HOLE G0 TWO BACK)
    (TEMPERATURE G0 COLD)
    (SHAPE H0 CIRCULAR)
    (SURFACE-CONDITION H0 POLISHED)
    (PAINTED H0 BLUE)
    (HAS-HOLE H0 THREE BACK)
    (TEMPERATURE H0 COLD)
    (SHAPE I0 CIRCULAR)
    (SURFACE-CONDITION I0 SMOOTH)
    (PAINTED I0 BLACK)
    (HAS-HOLE I0 ONE BACK)
    (TEMPERATURE I0 COLD)
    (SHAPE J0 CIRCULAR)
    (SURFACE-CONDITION J0 POLISHED)
    (PAINTED J0 RED)
    (HAS-HOLE J0 THREE FRONT)
    (TEMPERATURE J0 COLD)
    (SHAPE K0 OBLONG)
    (SURFACE-CONDITION K0 SMOOTH)
    (PAINTED K0 BLUE)
    (HAS-HOLE K0 THREE FRONT)
    (TEMPERATURE K0 COLD)
    (SHAPE L0 OBLONG)
    (SURFACE-CONDITION L0 ROUGH)
    (PAINTED L0 RED)
    (HAS-HOLE L0 TWO FRONT)
    (TEMPERATURE L0 COLD)
    (SHAPE M0 CYLINDRICAL)
    (SURFACE-CONDITION M0 SMOOTH)
    (PAINTED M0 YELLOW)
    (HAS-HOLE M0 ONE BACK)
    (TEMPERATURE M0 COLD)
    (SHAPE N0 OBLONG)
    (SURFACE-CONDITION N0 POLISHED)
    (PAINTED N0 BLUE)
    (HAS-HOLE N0 TWO FRONT)
    (TEMPERATURE N0 COLD)
    (SHAPE O0 CIRCULAR)
    (SURFACE-CONDITION O0 POLISHED)
    (PAINTED O0 BLUE)
    (HAS-HOLE O0 TWO FRONT)
    (TEMPERATURE O0 COLD)
    (SHAPE Q0 CIRCULAR)
    (SURFACE-CONDITION Q0 ROUGH)
    (PAINTED Q0 BLUE)
    (HAS-HOLE Q0 THREE BACK)
    (TEMPERATURE Q0 COLD)
    (SHAPE P0 CIRCULAR)
    (SURFACE-CONDITION P0 POLISHED)
    (PAINTED P0 BLACK)
    (HAS-HOLE P0 ONE BACK)
    (TEMPERATURE P0 COLD)
    (SHAPE R0 CYLINDRICAL)
    (SURFACE-CONDITION R0 POLISHED)
    (PAINTED R0 BLACK)
    (HAS-HOLE R0 ONE BACK)
    (TEMPERATURE R0 COLD)
    (SHAPE S0 OBLONG)
    (SURFACE-CONDITION S0 POLISHED)
    (PAINTED S0 RED)
    (HAS-HOLE S0 TWO FRONT)
    (TEMPERATURE S0 COLD)
    (SHAPE U0 OBLONG)
    (SURFACE-CONDITION U0 SMOOTH)
    (PAINTED U0 BLUE)
    (HAS-HOLE U0 ONE BACK)
    (TEMPERATURE U0 COLD)
    (SHAPE V0 OBLONG)
    (SURFACE-CONDITION V0 SMOOTH)
    (PAINTED V0 RED)
    (HAS-HOLE V0 TWO FRONT)
    (TEMPERATURE V0 COLD)
    (SHAPE W0 CYLINDRICAL)
    (SURFACE-CONDITION W0 ROUGH)
    (PAINTED W0 RED)
    (HAS-HOLE W0 TWO FRONT)
    (TEMPERATURE W0 COLD)
    (SHAPE Z0 CIRCULAR)
    (SURFACE-CONDITION Z0 POLISHED)
    (PAINTED Z0 BLACK)
    (HAS-HOLE Z0 ONE BACK)
    (TEMPERATURE Z0 COLD)
    (SHAPE A1 CIRCULAR)
    (SURFACE-CONDITION A1 SMOOTH)
    (PAINTED A1 YELLOW)
    (HAS-HOLE A1 TWO FRONT)
    (TEMPERATURE A1 COLD)
    (SHAPE B1 CYLINDRICAL)
    (SURFACE-CONDITION B1 POLISHED)
    (PAINTED B1 BLACK)
    (HAS-HOLE B1 ONE FRONT)
    (TEMPERATURE B1 COLD)
    (SHAPE C1 OBLONG)
    (SURFACE-CONDITION C1 SMOOTH)
    (PAINTED C1 YELLOW)
    (HAS-HOLE C1 ONE FRONT)
    (TEMPERATURE C1 COLD)
    (SHAPE D1 OBLONG)
    (SURFACE-CONDITION D1 POLISHED)
    (PAINTED D1 BLACK)
    (HAS-HOLE D1 TWO BACK)
    (TEMPERATURE D1 COLD)
    (SHAPE E1 OBLONG)
    (SURFACE-CONDITION E1 POLISHED)
    (PAINTED E1 YELLOW)
    (HAS-HOLE E1 THREE BACK)
    (TEMPERATURE E1 COLD)
    (SHAPE F1 CIRCULAR)
    (SURFACE-CONDITION F1 SMOOTH)
    (PAINTED F1 BLUE)
    (HAS-HOLE F1 TWO FRONT)
    (TEMPERATURE F1 COLD)
    (SHAPE G1 OBLONG)
    (SURFACE-CONDITION G1 SMOOTH)
    (PAINTED G1 RED)
    (HAS-HOLE G1 ONE BACK)
    (TEMPERATURE G1 COLD)
    (SHAPE H1 CYLINDRICAL)
    (SURFACE-CONDITION H1 SMOOTH)
    (PAINTED H1 YELLOW)
    (HAS-HOLE H1 ONE FRONT)
    (TEMPERATURE H1 COLD)
    (SHAPE I1 CYLINDRICAL)
    (SURFACE-CONDITION I1 SMOOTH)
    (PAINTED I1 BLUE)
    (HAS-HOLE I1 ONE BACK)
    (TEMPERATURE I1 COLD)
    (SHAPE J1 CYLINDRICAL)
    (SURFACE-CONDITION J1 POLISHED)
    (PAINTED J1 BLACK)
    (HAS-HOLE J1 TWO BACK)
    (TEMPERATURE J1 COLD)
    (SHAPE K1 CYLINDRICAL)
    (SURFACE-CONDITION K1 POLISHED)
    (PAINTED K1 BLUE)
    (HAS-HOLE K1 THREE FRONT)
    (TEMPERATURE K1 COLD)
    (SHAPE L1 CYLINDRICAL)
    (SURFACE-CONDITION L1 POLISHED)
    (PAINTED L1 RED)
    (HAS-HOLE L1 THREE FRONT)
    (TEMPERATURE L1 COLD)
    (SHAPE M1 OBLONG)
    (SURFACE-CONDITION M1 POLISHED)
    (PAINTED M1 YELLOW)
    (HAS-HOLE M1 THREE FRONT)
    (TEMPERATURE M1 COLD)
    (SHAPE N1 CYLINDRICAL)
    (SURFACE-CONDITION N1 POLISHED)
    (PAINTED N1 YELLOW)
    (HAS-HOLE N1 ONE BACK)
    (TEMPERATURE N1 COLD)
    (SHAPE O1 OBLONG)
    (SURFACE-CONDITION O1 ROUGH)
    (PAINTED O1 BLACK)
    (HAS-HOLE O1 ONE BACK)
    (TEMPERATURE O1 COLD)
    (SHAPE Q1 CYLINDRICAL)
    (SURFACE-CONDITION Q1 POLISHED)
    (PAINTED Q1 BLACK)
    (HAS-HOLE Q1 TWO FRONT)
    (TEMPERATURE Q1 COLD)
    (SHAPE P1 OBLONG)
    (SURFACE-CONDITION P1 SMOOTH)
    (PAINTED P1 YELLOW)
    (HAS-HOLE P1 THREE FRONT)
    (TEMPERATURE P1 COLD)
    (SHAPE R1 CIRCULAR)
    (SURFACE-CONDITION R1 SMOOTH)
    (PAINTED R1 RED)
    (HAS-HOLE R1 TWO BACK)
    (TEMPERATURE R1 COLD)
    (SHAPE S1 OBLONG)
    (SURFACE-CONDITION S1 ROUGH)
    (PAINTED S1 YELLOW)
    (HAS-HOLE S1 TWO BACK)
    (TEMPERATURE S1 COLD)
    (SHAPE U1 OBLONG)
    (SURFACE-CONDITION U1 SMOOTH)
    (PAINTED U1 RED)
    (HAS-HOLE U1 ONE FRONT)
    (TEMPERATURE U1 COLD)
    (SHAPE V1 CIRCULAR)
    (SURFACE-CONDITION V1 SMOOTH)
    (PAINTED V1 YELLOW)
    (HAS-HOLE V1 TWO FRONT)
    (TEMPERATURE V1 COLD)
    (SHAPE W1 CIRCULAR)
    (SURFACE-CONDITION W1 POLISHED)
    (PAINTED W1 RED)
    (HAS-HOLE W1 ONE BACK)
    (TEMPERATURE W1 COLD)
    (SHAPE Z1 OBLONG)
    (SURFACE-CONDITION Z1 POLISHED)
    (PAINTED Z1 YELLOW)
    (HAS-HOLE Z1 ONE BACK)
    (TEMPERATURE Z1 COLD)
    (SHAPE A2 CIRCULAR)
    (SURFACE-CONDITION A2 SMOOTH)
    (PAINTED A2 BLACK)
    (HAS-HOLE A2 TWO FRONT)
    (TEMPERATURE A2 COLD)
    (CAN-ORIENT DRILL-PRESS BACK)
    (CAN-ORIENT PUNCH BACK)
    (CAN-ORIENT DRILL-PRESS FRONT)
    (CAN-ORIENT PUNCH FRONT)
    (HAS-PAINT IMMERSION-PAINTER YELLOW)
    (HAS-PAINT SPRAY-PAINTER YELLOW)
    (HAS-PAINT IMMERSION-PAINTER BLUE)
    (HAS-PAINT SPRAY-PAINTER BLUE)
    (HAS-PAINT IMMERSION-PAINTER BLACK)
    (HAS-PAINT SPRAY-PAINTER BLACK)
    (HAS-PAINT IMMERSION-PAINTER RED)
    (HAS-PAINT SPRAY-PAINTER RED)
    (HAS-BIT DRILL-PRESS THREE)
    (HAS-BIT PUNCH THREE)
    (HAS-BIT DRILL-PRESS TWO)
    (HAS-BIT PUNCH TWO)
    (HAS-BIT DRILL-PRESS ONE)
    (HAS-BIT PUNCH ONE)
    (PART A2)
    (PART Z1)
    (PART W1)
    (PART V1)
    (PART U1)
    (PART S1)
    (PART R1)
    (PART P1)
    (PART Q1)
    (PART O1)
    (PART N1)
    (PART M1)
    (PART L1)
    (PART K1)
    (PART J1)
    (PART I1)
    (PART H1)
    (PART G1)
    (PART F1)
    (PART E1)
    (PART D1)
    (PART C1)
    (PART B1)
    (PART A1)
    (PART Z0)
    (PART W0)
    (PART V0)
    (PART U0)
    (PART S0)
    (PART R0)
    (PART P0)
    (PART Q0)
    (PART O0)
    (PART N0)
    (PART M0)
    (PART L0)
    (PART K0)
    (PART J0)
    (PART I0)
    (PART H0)
    (PART G0)
    (PART F0)
    (PART E0)
    (PART D0)
    (PART C0)
    (PART B0)
    (PART A0)
)
(:goal (and
    (PAINTED W1 BLACK)
    (PAINTED L1 BLACK)
    (SHAPE H0 CYLINDRICAL)
    (SHAPE Z1 CYLINDRICAL)
    (SHAPE D0 CYLINDRICAL)
    (SURFACE-CONDITION M0 ROUGH)
    (SHAPE E0 CYLINDRICAL)
    (SHAPE B0 CYLINDRICAL)
    (PAINTED Q1 RED)
    (SURFACE-CONDITION N0 ROUGH)
    (SHAPE S1 CYLINDRICAL)
    (PAINTED J0 BLUE)
    (SURFACE-CONDITION G1 POLISHED)
    (SURFACE-CONDITION I0 POLISHED)
    (PAINTED Q0 YELLOW)
    (PAINTED C1 BLUE)
    (PAINTED D0 BLACK)
    (SURFACE-CONDITION D1 SMOOTH)
    (PAINTED G0 BLACK)
    (SURFACE-CONDITION C0 ROUGH)
    (SURFACE-CONDITION O1 POLISHED)
    (SURFACE-CONDITION C1 ROUGH)
    (SHAPE G1 CYLINDRICAL)
    (SURFACE-CONDITION D0 POLISHED)
    (SHAPE M1 CYLINDRICAL)
    (PAINTED H1 BLUE)
    (SURFACE-CONDITION B1 ROUGH)
    (SHAPE V1 CYLINDRICAL)
    (PAINTED U1 BLUE)
    (SURFACE-CONDITION Q1 SMOOTH)
    (PAINTED Z1 BLACK)
    (SHAPE N0 CYLINDRICAL)
    (SHAPE C0 CYLINDRICAL)
    (SURFACE-CONDITION S1 SMOOTH)
    (SURFACE-CONDITION P0 ROUGH)
    (SURFACE-CONDITION M1 ROUGH)
    (PAINTED U0 RED)
    (SURFACE-CONDITION F0 POLISHED)
    (PAINTED E1 RED)
    (SHAPE A0 CYLINDRICAL)
    (PAINTED M0 RED)
    (SHAPE U0 CYLINDRICAL)
    (PAINTED N0 BLACK)
    (SURFACE-CONDITION W1 ROUGH)
    (SURFACE-CONDITION H0 SMOOTH)
    (PAINTED C0 YELLOW)
    (PAINTED O0 RED)
)))
