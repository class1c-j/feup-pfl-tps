% flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).

% get_all_nodes(-ListOfAirports)
get_all_nodes(ListOfAirports) :-
    setof(Airport,
          (Origin, Dest, Comp, Code, Hour, Dur)^(flight(Origin, Dest, Comp, Code, Hour, Dur),
                                                 (Origin = Airport; Dest = Airport)), ListOfAirports).

% most_diversified(-Company)

n_destinations(Company, N) :-
    setof(Destination,
          (Origin, Dest, Comp, Code, Hour, Dur)^(flight(Origin, Dest, Comp, Code, Hour, Dur),
                                                 (Dest = Destination, Comp=Company)), ListOfDestinations),
    length(ListOfDestinations, N).

most_diversified([Company], Company).
most_diversified([Best | T], Best) :-
    most_diversified(T, New),
    n_destinations(Best, BestScore),
    n_destinations(New, NextScore),
    BestScore >= NextScore.
most_diversified([Company | T], Best) :-
    n_destinations(Company, CompanyScore),
    n_destinations(Best, BestScore),
    BestScore >= CompanyScore,
    most_diversified(T, Best).

most_diversified(Company) :-
    setof(Company, (Origin, Dest, Code, Hour, Dur)^(flight(Origin, Dest, Company, Code, Hour, Dur)), Companies),
    most_diversified(Companies, Company).

