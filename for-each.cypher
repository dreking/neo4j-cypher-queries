// FOR EACH - For each element in a list, execute the subquery
// FOREACH is used to execute a subquery for each element in a list.
// It is often used to perform operations on collections of nodes or relationships.

// FOREACH - Create 3 nodes and connect them to a parent node
CREATE (parent:Parent {name: 'Parent Node'})
FOREACH (i IN range(1, 3) |
	CREATE (child:Child {name: 'Child Node ' + i})
	CREATE (parent)-[:HAS_CHILD]->(child)
)

// FOREACH - Update properties of nodes in a list
MATCH (n:Child)
WITH collect(n) AS children
FOREACH (child IN children |
	SET child.status = 'updated'
)

// FOREACH - Nested FOREACH to create relationships between nodes in two lists
CREATE (c:Node {name: 'Node C'})
CREATE (d:Node {name: 'Node D'})
WITH [c] AS listC, [d] AS listD
FOREACH (nodeC IN listC |
	FOREACH (nodeD IN listD |
		CREATE (nodeC)-[:CONNECTED_TO]->(nodeD)
	)
)

FOREACH (i IN range(1, 5) |
	FOREACH (j IN range(1, 3) |
		CREATE (n:NestedNode {name: 'Nested Node ' + i + '-' + j})
	)
)

FOREACH (i IN ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'] |
	CREATE (day:Day {name: i})
)


FOREACH (m IN ['January'] | CREATE (month:Month {name: m}))
FOREACH (n IN range(1,31) |
	CREATE (day:Day {name: 'Day-' + n})
	CREATE (month)-[:HAS_DAY]->(day)
)
