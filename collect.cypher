// COLLECT - Collects values into a list. This is an aggregation function, so it is used in conjunction with GROUP BY or in an aggregation context.
// The syntax for the COLLECT function is as follows:
// COLLECT(expression)

// Example 1: Collecting values into a list
MATCH (n:Person)
RETURN COLLECT(n.name) AS names

// Example 2: Collecting values with a condition
MATCH (n:Person)
WHERE n.age > 30
RETURN COLLECT(n.name) AS namesOver30
