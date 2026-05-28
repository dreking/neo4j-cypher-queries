// MERGE - matches existing nodes and relationships or creates new ones if they do not exist.
// MERGE is similar to MATCH followed by CREATE, but it ensures that the pattern exists in the graph. If the pattern already exists, it returns the existing nodes and relationships. If it does not exist, it creates the new nodes and relationships.

// MERGE - Matching or creating nodes
MERGE (a:Person {name: "AB"})
RETURN a

// MERGE - Matching or creating relationships
MERGE (a:Person {name: "AB"})-[:KNOWS]->(b:Person {name: "CD"})
RETURN a, b

MERGE (a:Person {name: "AB"})-[r1:KNOWS]->(b:Person {name: "CD"})-[r2:FRIENDS_WITH]->(c:Person {name: "EF"})
RETURN a, b, c, type(r1), type(r2)

// MERGE - ON CREATE WITH MERGE
MERGE (a:Person {name: "AB"})
ON CREATE SET a.created = timestamp()
RETURN a

// MERGE - ON MATCH WITH MERGE
MERGE (a:Person {name: "AB"})
ON MATCH SET a.lastSeen = timestamp()
RETURN a

// MERGE - Combining ON CREATE and ON MATCH
MERGE (a:Person {name: "AB"})
ON CREATE SET a.created = timestamp()
ON MATCH SET a.lastSeen = timestamp()
RETURN a

// MERGE - Using MERGE with properties
MERGE (a:Person {name: "AB"})
ON CREATE SET a.created = timestamp(), a.lastSeen = timestamp(), a.nationality = "Unknown"
ON MATCH SET a.lastSeen = timestamp(), a.nationality = "Unknown"
RETURN a
