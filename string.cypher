// LEFT() returns the leftmost number of characters from a string.
RETURN LEFT('Neo4j', 3) AS leftString

// RIGHT() returns the rightmost number of characters from a string.
RETURN RIGHT('Neo4j', 3) AS rightString

// LTRIM() removes leading whitespace from a string.
RETURN LTRIM('   Neo4j   ') AS leftTrimmed

// RTRIM() removes trailing whitespace from a string.
RETURN RTRIM('   Neo4j   ') AS rightTrimmed

// TRIM() removes leading and trailing whitespace from a string.
RETURN TRIM('   Neo4j   ') AS trimmedString

// REPLACE() replaces all occurrences of a substring within a string with another substring.
RETURN REPLACE('Neo4j is great', 'great', 'awesome') AS replacedString

// REVESE() reverses the characters in a string.
RETURN REVERSE('Neo4j') AS reversedString

// SPLIT() splits a string into a list of substrings based on a delimiter.
RETURN SPLIT('Neo4j is great', ' ') AS splitString

// SUBSTRING() returns a substring of a string starting from a specified index and with a specified length.
// The syntax is SUBSTRING(string, startIndex, length).
RETURN SUBSTRING('Neo4j is great', 0, 5) AS substringString

// TOLOWER() converts a string to lowercase.
RETURN TOLOWER('Neo4j') AS lowerCaseString

// TOUPPER() converts a string to uppercase.
RETURN TOUPPER('Neo4j') AS upperCaseString

// TOSTRING() converts a value to a string.
RETURN TOSTRING(123) AS stringValue
