// MATCHING ALL NODES
MATCH (n)
RETURN n

// MATCH NODES WITH A SPECIFIC LABEL - GROUPING
MATCH (n:Movie)
RETURN n

// MATCH NODES WITH SPECIFIC PROPERTIES
MATCH (n {title: "The Matrix"})
RETURN n

// MATCH NODES WITH MULTIPLE LABELS AND SPECIFIC PROPERTIES
MATCH (n:Movie:Action)
MATCH (n:Movie:Action {title: "The Matrix"})
RETURN n

// MATCH NODES WITH A SPECIFIC LABEL AND RETURN ONLY THE PROPERTIES
MATCH (n:Movie)
RETURN n.title, n.release_year

// MATCH ANY NODES WITH ANY RELATIONSHIPS
MATCH (n)-[r]-(m)
RETURN *

// MATCH NODES WITH A SPECIFIC LABEL AND ANY RELATIONSHIPS
MATCH (n:Person {name: "Tom Hanks"})-[r]-(m)
RETURN *

MATCH (n:Person {name: "Robert Zemeckis"})-[r]-(m:Movie)
RETURN m

MATCH (n:Person {name: "Robert Zemeckis"})-[r:DIRECTED]-(m:Movie)
RETURN n, r, m

MATCH (n:Movie {title: "The Polar Express"})<-[r]-(m)
RETURN *

// MATCH NODES WITH UNCOMMON CHARACTERS
MATCH (`this is very good movie`) // Same as MATCH (n)
RETURN `this is very good movie` // Same as RETURN n

// COPYING PROPERTIES FROM ONE NODE TO ANOTHER
MATCH (a:Movie {title: "V for Vendetta"})
CREATE (b:Movie {title: "The Copycat", released: a.released})
RETURN b

// COPYING PROPERTIES FROM RELATIONSHIP TO ANOTHER
CREATE (a:Person {name: "AB"})-[r1:KNOWS {since:2016}]->(b:Person {name: "BC"})
CREATE (c:Person {name: "CC"})-[r2:KNOWS {since: r1.since}]->(b)
RETURN *

// MATCHING NODES WITH SPECIFIC PROPERTIES AND RELATIONSHIPS AND RETURNING THEM
MATCH (a:Person {name: "AB"})-[r]-(b)
RETURN b.name

// MATCH MULTIPLE RELATIONSHIPS AND NODES
MATCH (a:Person {name: "AB"})-[r:FAMILY_OF|RELATIVE_OF]-(b)
RETURN a, r, b

// MATCHING NODES AND CREATING RELATIONS
MATCH (a:Person {name: "AB"}), (b:Person {name: "BC"})
CREATE (a)-[r:KNOWS]->(b)-[r2:KNOWS]->(a)
RETURN a, b, r, r2

// MATCHING NODES WHERE ACTOR ACTED IN MOVIE AND DIRECTOR DIRECTED THE SAME MOVIE
MATCH (a:Person)-[r:ACTED_IN]->(m:Movie)<-[r2:DIRECTED]-(d:Person)
RETURN a.name AS Actor, m.title AS Movie, d.name AS Director

// MATCHING NODES WHERE AN ACTOR HAS CO-ACTORS ACTED IN ANY MOVIE
MATCH (a:Person {name: "Tom Hanks"})-[r:ACTED_IN]->(m:Movie)<-[r2:ACTED_IN]-(coActor)
RETURN a.name AS Actor, m.title AS Movie, coActor.name AS CoActor

// OPTIONAL MATCHING - MATCHING NODES WITH OPTIONAL RELATIONSHIPS
MATCH (a:Person {name: "Tom Hanks"})
OPTIONAL MATCH (a)-[r:ACTED_IN]->(m:Movie)
RETURN a.name AS Actor, m.title AS Movie

// MATCHING - Variable length relationships
// (*1..3 means 1 to 3 relationships, *1.. means 1 or more relationships, *0..3 means 0 to 3 relationships)
// (* means any number of relationships, *1 means exactly 1 relationship, *..3 means 0 to 3 relationships)
MATCH (a:Person {name: "Tom Hanks"})-[r:ACTED_IN*1..3]->(m:Movie)
RETURN a.name AS Actor, m.title AS Movie

MATCH (a:Person {name: "Tom Hanks"})-[r:ACTED_IN*1..]->(m:Movie)
RETURN a.name AS Actor, m.title AS Movie

MATCH (a:Person {name: "Tom Hanks"})-[r:ACTED_IN*0..3]->(m:Movie)
RETURN a.name AS Actor, m.title AS Movie

MATCH p= (a)-[*]->(m)<-[*]-(d)
RETURN p
