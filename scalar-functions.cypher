// COALESCE() returns the first non-null value in a list of expressions.
RETURN COALESCE(NULL, NULL, 'first non-null', 'second non-null') AS result

MATCH (n)
WHERE n.name='Rita'
RETURN COALESCE(n.nationality, n.name) AS displayName

// ENDNODE() returns the nodes at the ends of a relationship.
MATCH (a)-[r]->(b)
RETURN a, b, ENDNODE(r) AS endNodes

// HEAD() returns the first element of a list.
RETURN HEAD([1, 2, 3]) AS firstElement

MATCH (n)
RETURN HEAD(collect(n.name)) AS firstName

// ID() returns the internal id of a node or relationship.
MATCH (n)
RETURN ID(n) AS nodeId

// LAST() returns the last element of a list.
RETURN LAST([1, 2, 3]) AS lastElement

MATCH (n)
RETURN LAST(collect(n.name)) AS lastName

// LENGTH() returns the number of elements in a list or the number of characters in a string,
MATCH p=(n)-[*]->(m)
RETURN LENGTH(p) AS pathLength

// PROPERTIES() returns a map of all properties of a node or relationship.
MATCH (n)
RETURN PROPERTIES(n) AS nodeProperties

// RANDOMUUID() returns a random UUID.
RETURN RANDOMUUID() AS randomUuid

// SIZE() returns the number of elements in a list or the number of characters in a string,list, pattern expression, or map.
RETURN SIZE([1, 2, 3]) AS listSize

MATCH (n)
RETURN SIZE(n.name) AS nameLength

// STARTNODE() returns the node at the start of a relationship.
MATCH (a)-[r]->(b)
RETURN a, b, STARTNODE(r) AS startNodes

// TOFLOAT() converts a value to a floating point number.
RETURN TOFLOAT('3.14') AS floatValue

// TOINTEGER() converts a value to an integer.
RETURN TOINTEGER('42') AS integerValue

// TYPE() returns the type of a relationship.
MATCH (a)-[r]->(b)
RETURN TYPE(r) AS relationshipType
