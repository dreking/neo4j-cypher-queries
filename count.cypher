// COUNT - Aggregating results
MATCH (p:Person)
RETURN COUNT(p) AS totalPersons

// COUNT - Distinct values
MATCH (p:Person)
RETURN COUNT(DISTINCT p.name) AS uniqueNames

// COUNT - Filtering with WHERE
MATCH (p:Person)
WHERE p.age > 30
RETURN COUNT(p) AS olderThan30

// COUNT - Relationships
MATCH (p:Person)-[:FRIENDS_WITH]->(friend)
RETURN p.name, COUNT(friend) AS numberOfFriends

MATCH (p:Person)-[:ACTED_IN]->(movie:Movie)
RETURN p.name, COUNT(movie) AS numberOfMovies

// COUNT - Grouping results
MATCH (p:Person)-[:ACTED_IN]->(movie:Movie)
RETURN labels(movie), COUNT(p) AS actorsInMovie
