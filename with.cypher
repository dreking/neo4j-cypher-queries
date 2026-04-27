// WITH CLAUSE - used to chain multiple queries together, pass variables between them, and perform aggregations or transformations on the data before returning it
// WITH CLAUSE - chaining multiple queries together
MATCH (n:Movie), (m:Person)
WITH n
RETURN n.title, n.released

// WITH CLAUSE - convert names to uppercase before returning
MATCH (n:Person)
WITH n, toUpper(n.name) AS upperName
WHERE upperName ENDS WITH "A"
RETURN upperName

// WITH CLAUSE - with aliases and aggregations
MATCH (n:Movie)
WITH n, count(*) AS total
RETURN n, total

// WITH CLAUSE - filtering results before returning
MATCH (n:Movie)
WITH n
ORDER BY n.released DESC
RETURN n.title, n.released

// WITH CLAUSE - using COLLECT to aggregate related nodes
MATCH (n:Movie)<-[:ACTED_IN]-(p:Person)
WITH n, collect(p.name) AS actors
RETURN n.title, actors

// WITH CLAUSE - using SKIP and LIMIT for pagination
MATCH (n:Movie)
WITH n
ORDER BY n.released DESC
SKIP 5
LIMIT 5
RETURN COLLECT(n.title), n.released

// WITH CLAUSE - combining multiple queries
MATCH (n:Person{name: "Meg Ryan"})-[r]-(m)
WITH m
ORDER BY m.released DESC
WHERE m.released < 2000
MATCH (m)-[r]-(t)
WITH t
WHERE t.name = "Tom Hanks"
RETURN t.name
