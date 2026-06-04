// WHERE for filtering results
MATCH (p:Person)
WHERE p.name = 'Alice'
RETURN p

// WHERE - Labels
MATCH (p)
WHERE p:Person
RETURN p

// WHERE - Node properties
MATCH (p:Person)
WHERE p.age > 30
// WHERE p.age > 30 OR p.age < 20
// WHERE p.age = 30
RETURN p.name, p.age
ORDER BY p.age DESC

// WHERE - Relationship properties
MATCH (a:Supplier)-[r:SUPPLIES]->(b:Client)
WHERE r.since < 2020
// SET r.since = 2020
RETURN a.name, b.name, r.since

// WHERE - String functions
MATCH (p:Person)
WHERE toLower(p.name) STARTS WITH 'a'
RETURN p.name

MATCH (p:Person)
WHERE p.name CONTAINS 'li'
RETURN p.name

MATCH (p:Person)
WHERE p.name ENDS WITH 'e'
RETURN p.name

// WHERE - lists
MATCH (p:Person)
WHERE p.name IN ['Alice', 'Bob']
RETURN p.name

MATCH (p:Person)
WHERE NOT p.name = 'Alice'
RETURN p.name

// WHERE - filtering on patterns with properties
MATCH (a:Person)
WHERE (a)-[:FOLLOWS]->({name: 'Angela Scope'})
RETURN a.name

// WHERE - existential subqueries
MATCH (a:Person)
WHERE EXISTS {
	MATCH (a)-[:FOLLOWS]->(b:Person)
	WHERE b.name = 'Angela Scope'
}
RETURN a.name

MATCH (a:Person)
WHERE EXISTS {
	MATCH (a)-[:FOLLOWS]->(b:Person)
	WHERE EXISTS {
		(b:Person)-[:FOLLOWS]->(c:Person)
		WHERE c.name CONTAINS 'Thomp'
	}
}
RETURN a.name
