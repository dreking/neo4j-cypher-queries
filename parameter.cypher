// PARAMETERS
// Parameters are used to pass values into Cypher queries.
// They are prefixed with a dollar sign ($) and can be used in place of literal values in the query.
// This allows for more flexible and reusable queries, as the same query can be executed with different parameter values without needing to modify the query itself.

// PARAM - set parameter values
:param name => 'Keanu Reeves'

MATCH (p:Person)
WHERE p.name = $name
RETURN p

// PARAM - update parameter values
:param name => 'Keanu'

// PARAM - multiple parameters
:param {name: 'Keanu Reeves', age: 57}

// PARAM - name parameter values
:param {profile: {name: 'Keanu Reeves', age: 57}}
WITH $profile AS profile
RETURN profile.name, profile.age

UNWIND keys($profile) AS profile
RETURN profile, $profile[profile] AS value

// PARAM - list all parameters, remove parameters
:params // Lists all parameters and their values
:params CLEAR // removes all parameters

// PARAM - set array params to be used in CREATE
:param names => ['Alice', 'Bob', 'Charlie']
UNWIND $names AS name
CREATE (p:Person {name: name})
RETURN p

// PARAM - with skip and limit
:param {skip: 0, limit: 10}
MATCH (p:Person)
RETURN p
SKIP $skip
LIMIT $limit

// PARAM - with ids
:param ids => [1, 2, 3]
MATCH (p)
WHERE id(p) IN $ids
RETURN p
