// CREATE STATEMENT - single node
CREATE ()

// CREATE STATEMENT - multiple nodes
CREATE (), ()

// CREATE STATEMENT - single node with variable
CREATE (a)
RETURN a

// RETURN ALL NODES CREATED
MATCH (n)
RETURN n

// DELETE ALL NODES CREATED
MATCH (n)
DETACH
DELETE n

// CREATE STATEMENT WITH LABEL
CREATE (a:Person)
RETURN a

// CREATE STATEMENT WITH LABELS
CREATE (a:Person:Employee)
RETURN a

// CREATE STATEMENT WITH PROPERTIES
CREATE (a:Person {name: 'Alice', age: 30, email: 'alice@example.com'})
RETURN a

// CREATE STATEMENT WITH RELATIONSHIP
CREATE (a:Supplier {name: 'Alice'})-[r:SUPPLIES]->(b:Client {name: 'Bob'})
RETURN a, b, r

// RETURN ALL NODES AND RELATIONSHIPS CREATED AND ASTERISK (*) TO RETURN ALL PROPERTIES
MATCH (n)-[r]->(m)
RETURN *
// RETURN n, r, m

// EXERCISE: CREATE 3 NODES WITH LABELS AND PROPERTIES, AND 2 RELATIONSHIPS BETWEEN THEM
CREATE (a:Person {name: "Peter"})-[r:MARRIED_TO]->(b:Person {name: "Anne"}), (c:Property {name: "House"}), (a)-[r2:HAS]->(c)
RETURN *

CREATE (h:Property {name: "House 1"})<-[r1:HAS]-(a:Person {name: "Peter 1"})-[r2:MARRIED_TO]->(b:Person {name: "Anne 1"})
RETURN *

// RELATIONSHIP WITH UNCOMMON CHARACTERS
CREATE (a:Person {name: "John"})-[r:`the forgotten friend of`]->(b:Person {name: "Jane"})
RETURN *

// EXERCISE: CREATE 3 NODES WITH LABELS AND PROPERTIES, AND 2 RELATIONSHIPS BETWEEN 2 OF THEM, 1 NODE WITH RELATIONSHIP WITH THE REST OF THE NODES
CREATE (a:Person {name: "Tim"})-[r1:FOLLOWS]->(b:Person {name: "Kate"})<-[r2:FOLLOWS]-(c:Person {name:"Paul"}),(a)-[r3:FOLLOWS]->(c),(b)-[r4:FOLLOWS]->(a)
RETURN *

// CREATING A FULL PART OF A GRAPH
CREATE p = (a:Person {name: "Tim"})-[r1:FOLLOWS]->(b:Person {name: "Kate"})<-[r2:FOLLOWS]-(c:Person {name:"Paul"})
RETURN p

// EXERCISE: CREATE A FAMILY TREE WITH 3 GENERATIONS, 2 NODES IN EACH GENERATION, AND RELATIONSHIPS BETWEEN PARENTS AND CHILDREN
// ------- 1
CREATE (d:Person {name: "Dan"}),
(k:Person {name: "Kate"}),
(m:Person {name: "Mike"}),
(l:Person {name: "Luke"}),
(s:Person {name: "Steve"}),
(f:Person {name: "Favor"}),
(fa:Person {name: "Faith"}),
(j:Person {name: "Jane"}),
(d)-[r1:MARRIED_TO]->(k)-[r2:MARRIED_TO]->(d),
(d)-[r3:PARENT_OF]->(m)<-[r4:PARENT_OF]-(k),
(d)-[r5:PARENT_OF]->(l)<-[r6:PARENT_OF]-(k),
(d)-[r7:PARENT_OF]->(s)<-[r8:PARENT_OF]-(k),
(f)-[r9:MARRIED_TO]->(s)-[r10:MARRIED_TO]->(f),
(f)-[r11:PARENT_OF]->(fa)<-[r12:PARENT_OF]-(s),
(f)-[r13:PARENT_OF]->(j)<-[r14:PARENT_OF]-(s)
RETURN *

// EXERCISE: CREATE CRIME SCENE WITH NODES(SUSPECT,VICTIM,CRIME,OFFICER,WEAPON,LOCATION) AND RELATIONSHIPS(BETWEEN SUSPECT AND CRIME, VICTIM AND CRIME, OFFICER AND CRIME, WEAPON AND CRIME, LOCATION AND CRIME)
CREATE (d:Person:Suspect {name: "Dan"}),
(a:Person:Suspect {name: "Andrew"}),
(c:Crime {title: "Killing a dog"}),
(e:Person:Officer {name: "Eric"}),
(w:Weapon {name: "Car"}),
(l:Location {name: "4 AB Street"}),
(v:Victim {name: "Dog"}),
(d)-[:PARTY_OF]->(c)<-[:PARTY_OF]-(a),
(w)-[:INVOLVED_IN]->(c)<-[:INVESTIGATED_BY]-(e),
(v)-[:VICTIM_OF]->(c)<-[:OCCURRED_AT]-(l),
(v)-[:KILLED_AT]->(l)

RETURN *

// EXERCISE: CREATE COMPANY STRUCTURE WITH NODES(COMPANY,EMPLOYEE,LOCATION,SUPPLIER,PRODUCTS,CUSTOMERS) AND RELATIONSHIPS(BETWEEN COMPANY AND EMPLOYEE, COMPANY AND LOCATION, COMPANY AND SUPPLIER, COMPANY AND PRODUCTS, COMPANY AND CUSTOMERS)
CREATE (a:Company {name: "ABB"}),
(s:Employee {name: "Steve"}),
(m:Employee {name: "Mike"}),
(d:Employee {name: "Dave"}),
(k:Employee {name: "Kate"}),
(an:Employee {name: "Anne"}),
(l:Location {name: "4 AB Street"}),
(lm:Supplier {name: "L&M"}),
(jt:Supplier {name: "Jack T"}),
(ps:Supplier {name: "PP Slover"}),
(ch:Product {name: "Chair"}),
(ta:Product {name: "Table"}),
(at:Customer {name: "AT"}),
(ml:Customer {name: "ML"}),
(ol:Customer {name: "OL"}),
(ak:Customer {name: "AKM"}),
(s)-[:WORK_AT]->(a)<-[:WORK_AT]-(m),
(d)-[:WORK_AT]->(a)<-[:WORK_AT]-(k),
(an)-[:WORK_AT]->(a),
(a)-[:PRODUCES]->(ch),
(a)-[:PRODUCES]->(ta),
(lm)-[:SUPPLIES]->(a),
(jt)-[:SUPPLIES]->(a),
(ps)-[:SUPPLIES]->(a),
(at)-[:CUSTOMER_OF]->(a),
(ml)-[:CUSTOMER_OF]->(a),
(ol)-[:CUSTOMER_OF]->(a),
(ak)-[:CUSTOMER_OF]->(a),
(a)-[:LOCATED_AT]->(l)

RETURN *
