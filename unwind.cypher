// UNWIND - Expands a list into a set of rows
// The UNWIND clause is used to transform a list into individual rows, which can then be processed further in the query.
// The syntax for the UNWIND clause is as follows:
// UNWIND list AS element

// Example 1: Unwind a list of numbers
UNWIND [1, 2, 3, 4, 5] AS number
RETURN number

// Example 2: Unwind a list of maps
UNWIND [{name: 'Alice', age: 30}, {name: 'Bob', age: 25}] AS person
RETURN person.name, person.age

// Example 3: Unwind a list and perform operations
UNWIND RANGE(0, 9) AS number
RETURN number, number * 2 AS doubled

// Example 4: Unwind a list and filter elements
UNWIND RANGE(0, 9) AS number
WITH number
WHERE number % 2 = 0
RETURN number

// UNWIND - distinct values
UNWIND [1, 2, 2, 3, 4, 4, 5] AS number
RETURN DISTINCT number

// UNWIND - distinct values with collect and aggregation
UNWIND [1, 2, 2, 3, 4, 4, 5] AS number
WITH DISTINCT number
RETURN COLLECT(number) AS uniqueNumbers

// UNWIND - with aggregation and grouping
WITH [1, 2, 2, 3, 4, 4, 5] AS a, [5, 4, 4, 3, 2, 2, 1] AS b
UNWIND (a + b) AS number
RETURN number, COUNT(*) AS occurrences

// UNWIND - list of lists
WITH [[1, 2], [3, 4], [5, 6]] AS sublist
UNWIND sublist AS innerList
UNWIND innerList AS number
RETURN number
