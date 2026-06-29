// NODES() returns a list of all nodes in the graph.
MATCH p =(a)
WHERE a.name = 'Tom Hanks'
RETURN nodes(p)

// REDUCE() reduces a list to a single value by applying a function to each element in the list.
// The syntax for the REDUCE function is as follows:
// REDUCE(accumulator = initialValue, variable IN list | expression)
// Example 1: Calculate the sum of a list of numbers
RETURN REDUCE(sum = 0, n IN [1, 2, 3, 4, 5] | sum + n) AS totalSum

MATCH p =(r)-->(d)<--(j)
WHERE r.name = 'Ruth' AND d.name = "Donald" AND j.name = "John"
RETURN r.salary + d.salary + j.salary

MATCH p =(r)-->(d)<--(j)
WHERE r.name = 'Ruth' AND d.name = "Donald" AND j.name = "John"
RETURN reduce(totalSalary = 0, k IN nodes(p)| totalSalary + tointeger(k.salary)) AS reduction

// TAIL() returns a list containing all elements of a list except the first one.
RETURN TAIL([1, 2, 3, 4, 5]) AS tailList

// REVERSE() reverses the order of elements in a list.
RETURN REVERSE([1, 2, 3, 4, 5]) AS reversedList

// KEYS() returns a list of property keys for a node or relationship.
MATCH (n:Person{name: 'Tom Hanks'})
RETURN KEYS(n) AS propertyKeys

// LABELS() returns a list of labels for a node.
MATCH (n:Person{name: 'Tom Hanks'})
RETURN LABELS(n) AS nodeLabels

// RANGE() returns a list of numbers in a specified range.
RETURN RANGE(1, 10) AS numberRange
