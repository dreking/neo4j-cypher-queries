// ALL() returns true if all elements in a list satisfy a given predicate.
RETURN ALL(x IN [1, 2, 3, 4, 5] WHERE x > 0) AS allGreaterThanZero

MATCH p = (n:Person{name: 'Tom Hanks'})
RETURN ALL(x IN NODES(p) WHERE x:Movie) AS allMoviesAreNodes

// ANY() returns true if any element in a list satisfies a given predicate.
RETURN ANY(x IN [1, 2, 3, 4, 5] WHERE x > 3) AS anyGreaterThanThree

MATCH p =(a)-[*1..3]->(b)
WHERE a.name = 'Peter' AND b.name = 'Abu' AND any(x IN nodes(p) WHERE x.name ="Rita")
RETURN p

MATCH p =(a)-[*1..3]->(b)
WHERE a.name = 'Peter' AND b.name = 'Abu' AND any(x IN nodes(p) WHERE x.name ="Yin Lee")
RETURN p

// NONE() returns true if no elements in a list satisfy a given predicate.
RETURN NONE(x IN [1, 2, 3, 4, 5] WHERE x < 0) AS noneLessThanZero

MATCH p =(a)-[*1..3]->(b)
WHERE a.name = 'Peter' AND b.name = 'Abu' AND none(x IN nodes(p) WHERE x.name ="Eric")
RETURN p

MATCH p =(a)-[*1..3]->(b)
WHERE a.name = 'Peter' AND b.name = 'Abu' AND none(x IN nodes(p) WHERE x.name ="Rita")
RETURN p

// SINGLE() returns true if exactly one element in a list satisfies a given predicate.
RETURN SINGLE(x IN [1, 2, 3, 4, 5]	WHERE x = 3) AS singleIsThree
