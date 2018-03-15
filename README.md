# N-ary_Tree_and_Traversal_based_on_Prolog

A realization of n-ary tree and its traversal based on Prolog, came out by myself. The completion of finding a reasonable route from the most Western to the East based on GPS information, the facts in the database as you can see at the beginning of the code is already sorted from the most Western to the most Eastern, they are names and GPS coordinates of the wading pools in Ottawa. To find a "reasonable" solution of the route, 

1. Build a tree:  
(1) Store the most Western pool as the root node;  
(2) Connect the closest pool with an edge as the child of the root;  
(3) For each pool from West to East connect the node for the pool with an edge as the child of the closest node in the tree (and this will result in an n-ary tree);  
2. Search for a route  
(1) Perform a pre-order traversal to find a route;  
(2) Calculate and store the accumulated distance for each node;  
(3) Save the solution in XXXX.txt in the same directory of this prolog program.  

The structure of my n-ary tree likes following (Node_Name, [Sub_Node_Name_1, Sub_Node_Name_2, ...]):

node('GlenCairn', ['Corkstown']).  
node('Entrance', []).  
node('Corkstown', ['Entrance', 'Michle']).  
node('Britannia', []).  
node('Michle', ['Britannia', 'RuthWildgen']).  
node('Lisa', []).  
node('RuthWildgen', ['FrankRyan', 'Lisa']).  
node('FrankRyan', ['Parkway']).  
node('Woodroffe', ['McKellar']).  
node('Parkway', ['Woodroffe', 'Kingsmere']).  
node('Kingsmere', ['BelAir']).  
node('BelAir', ['Agincourt']).  
node('McKellar', ['Westboro']).  
node('Lions', ['Champlain', 'Iona']).  
node('Westboro', ['Lions', 'Raven']).  
node('BellevueManor', []).  
node('Hampton', []).  
node('Iona', ['Hampton']).  
node('Agincourt', ['Crestview']).  
node('Raven', ['BellevueManor', 'Alexander']).  
node('Champlain', ['Parkdale']).  
node('Alexander', ['Meadowvale']).  
node('Parkdale', ['Reid']).  
node('GeneralBurns', []).  
node('Crestview', ['GeneralBurns']).  
node('EvTremblay', []).  
node('Reid', ['Chaudiere', 'EvTremblay']).  
node('Meadowvale', ['Rideauview']).  
node('Chaudiere', ['McNabb']).  
node('CarletonHeights', []).  
node('Rideauview', ['CarletonHeights']).  
node('McNabb', ['Bingham', 'St.Lukes']).  
node('Bingham', ['JulesMorin']).  
node('St.Lukes', ['SylviaHolden', 'SandyHill']).  
node('Windsor', []).  
node('Strathcona', []).  
node('Brantwood', []).  
node('SylviaHolden', ['Heron', 'Windsor', 'Brantwood']).  
node('Optimiste', []).  
node('JulesMorin', ['Optimiste']).  
node('SandyHill', ['Strathcona', 'DutchiesHole']).  
node('AltaVista', []).  
node('Heron', ['PaulineVanier', 'AltaVista']).  
node('Owl', []).  
node('DutchiesHole', ['Overbrook']).  
node('PaulineVanier', ['Owl', 'FrankLicari']).  
node('AlvinHeights', []).  
node('Kiwanis', ['AlvinHeights', 'St-Laurent']).  
node('FrankLicari', ['Pushman']).  
node('St.Pauls', []).  
node('St-Laurent', ['St.Pauls']).  
node('Overbrook', ['Kiwanis', 'CecilMorrison']).  
node('CecilMorrison', ['Balena']).  
node('Pushman', ['Greenboro']).  
node('Balena', ['Canterbury']).  
node('Canterbury', ['Weston']).  
node('ElizabethManley', []).  
node('Greenboro', ['ElizabethManley']).  
node('Hawthorne', []).  
node('Weston', ['AldaBurt', 'Hawthorne']).  
node('Bearbrook', []).  
node('AldaBurt', ['Bearbrook'])  

(You can check the above with the query of "listing(node)." after you run the program)  


Warning: This program and the structure of n-ary tree is just for your idea. Be careful when copying or imitating this program, the professor may catch you! Because some implements may seems pretty neat and easy to recognize.  
