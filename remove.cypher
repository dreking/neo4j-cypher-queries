// REMOVE - remove a property from a node or relationship, or remove a label from a node

// REMOVE - a property from a node
MATCH (a:Person {name: 'Alice' })
REMOVE a.age, a.email
RETURN properties(a) AS aliceProperties

// REMOVE - a property from a relationship
MATCH (a:Person {name: 'Alice'})-[r:KNOWS]->(b:Person {name: 'Bob'})
REMOVE r.since

// REMOVE - a label from a node
MATCH (a:Person {name: "Alice"})
REMOVE a:Person:Employee
RETURN labels(a) AS aliceLabels
