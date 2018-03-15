%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

"To run this program, just run with the query 'findRoute(L),saveRoute(L,'Route_Solution.txt').'"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- dynamic node/2, dist/3, llist/1, result/1 .
%"Dynamic predicates, database 'node' is used for storing the n-ary tree"
%"Database 'dist' is used for storing the temporary distance"
%"Database 'llist' is used for storing the result that only contains the name of pools"
%"Database 'result' is used for storing the list that is obtained by the predicate 'findRoute'"




%"Data after preprocessing, which is already sorted from the most Western pool to the most Eastern pool."
gps('GlenCairn',-75.885043214036457,45.295523988235892).
gps('Corkstown',-75.827332787684327,45.346092281227243).
gps('Entrance',-75.816756095205832,45.326318948202157).
gps('Michèle',-75.802019009313298,45.354886582192698).
gps('Britannia',-75.79935158132524,45.36063791083469).
gps('RuthWildgen',-75.795748543978704,45.351435749711783).
gps('FrankRyan',-75.789137765104144,45.356181572104489).
gps('Lisa',-75.78888493568607,45.344203611634356).
gps('Parkway',-75.775930803754449,45.356312783928672).
gps('Woodroffe',-75.772257047295838,45.376079873302182).
gps('McKellar',-75.766335560318097,45.383356299319395).
gps('Kingsmere',-75.762547946835497,45.364924158955333).
gps('BelAir',-75.762377623109913,45.35750853073128).
gps('Agincourt',-75.753609445688213,45.359592231244129).
gps('Westboro',-75.753012905671923,45.383906148155241).
gps('Lions',-75.752320478492635,45.394277708137942).
gps('Champlain',-75.744964509854412,45.404315899914522).
gps('Iona',-75.742472036698715,45.392425824249926).
gps('Raven',-75.740427905022671,45.376538041017916).
gps('BellevueManor',-75.738868568780319,45.372233154139181).
gps('Hampton',-75.738363444153038,45.38742953063268).
gps('Crestview',-75.737956709042493,45.344387632924054).
gps('Alexander',-75.731638585996592,45.380330193754176).
gps('Parkdale',-75.730230350941724,45.401386619089124).
gps('Meadowvale',-75.724776962609781,45.378281450833839).
gps('Reid',-75.723899834759322,45.398099493081517).
gps('GeneralBurns',-75.720681922288321,45.351722337236502).
gps('Chaudiere',-75.713538700632071,45.40984992554796).
gps('EvTremblay',-75.711482928452682,45.399346110831537).
gps('Rideauview',-75.706737085500833,45.367907282835596).
gps('McNabb',-75.702744980439732,45.40897618041744).
gps('CarletonHeights',-75.702541916133967,45.359635760017468).
gps('Bingham',-75.695707142658449,45.433645107791307).
gps('St.Lukes',-75.686964759247232,45.415132656598132).
gps('SylviaHolden',-75.682186449532566,45.402570494893908).
gps('JulesMorin',-75.681542772346148,45.433497486473115).
gps('Heron',-75.677265530777845,45.379555408333772).
gps('SandyHill',-75.676791786319157,45.421628374955425).
gps('PaulineVanier',-75.676559014966998,45.366710168887366).
gps('Windsor',-75.675937217993365,45.394532186176534).
gps('Strathcona',-75.672706866374114,45.428143208849782).
gps('Brantwood',-75.671621785677587,45.406132203975446).
gps('Optimiste',-75.668507860657428,45.442237661390195).
gps('DutchiesHole',-75.668098641076682,45.420784695340274).
gps('AltaVista',-75.666397145428704,45.383081724040146).
gps('Owl',-75.664796501240886,45.354388100821069).
gps('Overbrook',-75.657121027628364,45.425063416039791).
gps('FrankLicari',-75.657086303465249,45.368860860414067).
gps('Kiwanis',-75.653146263992767,45.436650377760252).
gps('AlvinHeights',-75.651008703653176,45.451479564355289).
gps('St-Laurent',-75.648490144242643,45.436351255364265).
gps('Pushman',-75.648252773948187,45.359589595427472).
gps('St.Pauls',-75.648131261039865,45.430041456602211).
gps('CecilMorrison',-75.645996115646469,45.417175891787146).
gps('Balena',-75.643413963860979,45.405059986943861).
gps('Greenboro',-75.636446232822834,45.363297932669155).
gps('Canterbury',-75.628832654798984,45.389521642267944).
gps('Weston',-75.62613467769313,45.39596271646451).
gps('AldaBurt',-75.625667001432149,45.402733068354976).
gps('ElizabethManley',-75.619369648157075,45.369990708956571).
gps('Hawthorne',-75.615926705023,45.39368089918365).
gps('Bearbrook',-75.563671464176309,45.434158595949889).


%"Predicate saveRoute/2 that takes as first argument the above solution and as a"
%"second argument a file name in which the solution will be stored."
saveRoute(L,FN):-
	open(FN,write,F),
	wrl(F,L),
	close(F).

%"'wrl/2' to make it possible to handle each pairs of (name,distance) separately in the predicate saveRoute/2."
wrl(F,[]):- !.
wrl(F,[(N,D)|T]):-
	write(F,N),
	tab(F,4),
	write(F,D),
	nl(F),
	wrl(F,T).

%"predicate findRoute/1 with the solution returned in the argument in the form of a list"
findRoute(LLLL):- 
	bagof([X,Y,Z],gps(X,Y,Z),[[N1|[LN1|[LT1]]]|T]),
	assertz(node(N1,[])),
	insert(T),
	node(N1,L),
	assertz(llist([N1])),
	traverse(L),
	llist(LL),
	assertz(result([(N1,0)])),
	cal(LL,0),
	result(LLLL).

%"Calculate the accumulated distance and save it into the database 'result', including the name of pools"
cal([XX],X):- !.
cal([N1|[N2|T]],B):- !,
	gps(N1,LN1,LT1),
	gps(N2,LN2,LT2),
	distance(LT1,LN1,LT2,LN2,D),
	result(R),
	TD is B + D,
	append(R,[(N2,TD)],RR),
	assertz(result(RR)),
	retract(result(R)),
	cal([N2|T],TD).

%"Traversal after the building of the n-ary tree"
traverse([]):- !.
traverse([H|T]):- !,
	node(H,L),
	llist(LL),
	append(LL,[H],LLL),
	assertz(llist(LLL)),
	retract(llist(LL)),
	traverse(L),
	traverse(T).

%"Building the n-ary tree."
insert([]):- !.
insert([[N1|[LN1|[LT1]]]|T]):- !,
	shortest(N1,N2),
	assertz(node(N1,[])),
	node(N2,L),
	append(L,[N1],LL),
	assertz(node(N2,LL)),
	retract(node(N2,L)),
	insert(T).

%"Find the node that is the closest to the current node we want to insert into the tree."
shortest(N1,N2):-
	bagof([X],EE^node(X,EE),L),
	calcu_dis(N1,L),
	setof([Z2,Y2],X2^dist(X2,Y2,Z2),[[D|[N2]]|T2]),  %find out the shortest node named N2,the distance D
	retractall(dist(XXX,YYY,ZZZ)).

%"Calculate the distance between every node and the current node we want to insert into the tree,"
%"then save these distances into the database 'dist'."
calcu_dis(N1,[]):- !.
calcu_dis(N1,[[N2]|T]):- !,
	gps(N1,LN1,LT1),
	gps(N2,LN2,LT2),
	distance(LT1,LN1,LT2,LN2,D),
	assertz(dist(N1,N2,D)),
	calcu_dis(N1,T).
	
%"The distance between two locations stored as latitude and longitude （great circle interpolation）."
distance(LT1,LN1,LT2,LN2,D):-
	RLT1 is pi*abs(LT1)/180,
	RLN1 is pi*abs(LN1)/180,
	RLT2 is pi*abs(LT2)/180,
	RLN2 is pi*abs(LN2)/180,
	D is 6371.0*2*asin(sqrt((sin((RLT1-RLT2)/2))*(sin((RLT1-RLT2)/2))+
			cos(RLT1)*cos(RLT2)*(sin((RLN1-RLN2)/2))*(sin((RLN1-RLN2)/2)))).








