# Example for Many-to-Many using FLOP

Minimal complete and verifiable example for handling a many-to-many relationship. The example is a tagging system, where an entity can have multiple tags and of course each tag can be used on multiple entities.

The challenge I am facing is, that on querying results with an inner join to a many-to-many relationship 

* the total-counts-property holds the sum of relationships instead of the total of entities.
* the entity only hold the one relationship, which has the object in question, but not the other ones