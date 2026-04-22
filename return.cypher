// RETURN STATEMENT - return anything
RETURN 25-6 as Calculator, "Hello World" as Greeting

// RETURN STATEMENT - return a variable
MATCH (n:Movie)
RETURN n.title

MATCH (n:Movie)
RETURN n.title, n.released

// RETURN RELATIONSHIPS/TYPES
MATCH (n:Movie {title: "The Matrix"})-[r]-(m)
RETURN r, type(r), r.type

// COLUMN ALIASES
MATCH (n:Movie {title: "The Matrix"})-[r]-(m)
RETURN n.title AS Movie, type(r) AS Relationship

// RETURN DISTINCT VALUES
MATCH (n:Movie)
RETURN DISTINCT n.released
ORDER BY n.released DESC

// ReTURN ALL PROPERTIES OF A NODE/RELATIONSHIP
MATCH (n:Movie {title: "The Matrix"})-[r]-(m)
RETURN PROPERTIES(n) AS MovieProperties, PROPERTIES(r) AS RelationshipProperties, PROPERTIES(m) AS OtherNodeProperties

// RETURN ALL LABELS OF A NODE
MATCH (n)
RETURN DISTINCT LABELS(n) AS MovieLabels

// RETURN ALL RELATIONSHIPS IN THE GRAPH
MATCH p = ()-[]-()
RETURN DISTINCT RELATIONSHIPS(p) AS AllRelationships
