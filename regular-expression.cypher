// Regular Expression - Basic usage

// . Matches any single character (except newline)
MATCH (p:Person)
WHERE p.name =~ 'Mik..Nichols'
RETURN p.name

// + Matches one or more occurrences of the preceding element
MATCH (p:Person)
WHERE p.name =~ 'Keanu Re+ves'
RETURN p.name

// ? Matches zero or one occurrence of the preceding element
MATCH (p:Person)
WHERE p.name =~ 'Keanu Reevess?'
RETURN p.name


// * Matches zero or more occurrences of the preceding element
MATCH (p:Person)
WHERE p.name =~ 'Keanu Re*ves'
RETURN p.name

// ^ Matches the start of a string
MATCH (p:Person)
WHERE p.name =~ '^K.*'
RETURN p.name

// $ Matches the end of a string
MATCH (p:Person)
WHERE p.name =~ '.*s$'
RETURN p.name

// [ ] Matches any one of the characters inside the brackets
MATCH (p:Person)
WHERE p.name =~ 'Keanu [Rr]eeves'
RETURN p.name

MATCH (p:Person)
WHERE p.name =~ 'K[a-z]* [Rr]eeves'
RETURN p.name

// ?i Case-insensitive matching
MATCH (p:Person)
WHERE p.name =~ '(?i)keanu reeves'
RETURN p.name

// ?m Multiline mode (affects ^ and $)
MATCH (p:Person)
WHERE p.name =~ '(?m)^Keanu Reeves'
RETURN p.name

// ?s Dotall mode (makes . match newline characters)
MATCH (p:Person)
WHERE p.name =~ '(?s)Keanu.*Reeves'
RETURN p.name

// \\ Escapes special characters
MATCH (p:Person)
WHERE p.name =~ 'Keanu\\? Reeves'
RETURN p.name
