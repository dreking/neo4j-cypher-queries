// SET - set property values
// Matches (n) and sets n.name to 'Alice' and n.age to 30
MATCH (n{name: 'Alice*'})
SET n.name = 'Alice', n.age = 30
RETURN n

// Matches (n) and sets n.name to 'Bob' and n.age to 25
MATCH (n{name: 'Bob*'})
SET n.name = 'Bob', n.age = 25
RETURN n

MATCH (n{name: 'Charlie*'})
SET n={name: 'Charlie', age: 35}
RETURN n

MATCH (n{name: 'Dave*'})
SET n += {name: 'Dave', age: 40}
RETURN n

// SET can also be used to set labels
MATCH (n{name: 'Keanu Reeves'})
SET n:Person:Employee
RETURN n

// SET can also be used to remove labels
MATCH (n{name: 'Keanu Reeves'})
SET n:Person
RETURN n

// SET can also be used to remove properties
MATCH (n{name: 'Keanu Reeves'})
SET n.born = null
RETURN n

// SET can also be used to update properties using expressions
MATCH (n{name: 'Keanu Reeves'})
SET n.age = toInteger(n.age) + 1
RETURN n

// SET can also be used to copy properties from another node
MATCH (n{name: 'Keanu Reeves'}), (m{name: 'Alice'})
SET n += m
RETURN n

// SET can also be used to copy relationship properties
MATCH (n{name: 'Keanu Reeves'})-[r:ACTED_IN]->(m)
SET r += {role: 'Neo'}
RETURN r
