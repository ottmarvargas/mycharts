This service determines the loyalty level of a given portfolio owner, based on their total portfolio value.  It also provides notifications whenever the loyalty level changes.

Currently the set of loyalty levels includes *Basic*, *Bronze*, *Silver*, *Gold*, and *Platinum*.

When it detects a change in level, it writes a JMS message to a JMS queue (such as on IBM MQ).  The **notification** microservice (a sibling to loyalty-level) reacts to those JMS messages.

This service expects query params named owner, total, and loyalty (the current loyalty level).  It returns a JSON object containing the owner and their loyalty.

For example, if you did a GET to http://localhost:9080/loyalty-level?owner=John&total=123456.78&loyalty=Silver, it would return `{"owner": "John", "loyalty": "Gold"}`, and would post a message with the following contents to a JMS queue (as configured in the server.xml): `{"owner": "John", "old": "Silver", "new": "Gold"}`.
