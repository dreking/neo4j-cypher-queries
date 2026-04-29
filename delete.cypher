// DELETE - delete nodes, relationships and paths

// DELETE - a note
MATCH (n:Note {id: 1})
DELETE n

// DELETE - a node and detach all relationships
MATCH (a:Person {name: 'Alice'})
DETACH
DELETE a

// DELETE - a relationship
MATCH (a:Person {name: 'Alice'})-[r:KNOWS]->(b:Person {name: 'Bob'})
DELETE r
