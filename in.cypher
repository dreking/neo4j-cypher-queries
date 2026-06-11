// IN - Basic usage
MATCH (p:Person)
WHERE p.name IN ['Alice', 'Bob', 'Charlie']
RETURN p.name

RETURN 5 IN [1, 2, 3, 4, 5] AS isInList
