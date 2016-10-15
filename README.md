Distributed Policy Evaluation Engine.

This is a da(python) based implementation of horizontally scaled distributed
policy evaluation engine.

Please refer the pseudocode document for explicit data structure details
and functions inside each components

Components are as follows:
1. 	Client - Process to send request and receive a response. This process directly
	sends the rquest to subject coordianator and receives a evaluation response
	to its request

2.	Coordinator - Coordinator process can be a subject coordinator or resource 
	coordinator. The functionality is decided upon the source from where the
	message is received (receive tag). Appropriate processing is done on each
	stage. 

	Subject coordinator receives request from client, forwards it to 
	resource coordinator, receives response from worker, resolves subject
	conflict if any and passes result to client

	Resource cooridnator forwards request to worker, resolves conflicts and
	alerts subject coordinator if there are any conflicts with respect to the
	resource attribute upates

	Both the cooridnators maintain caches, subject cooridnator maintains an 
	additional tentative cache. Both coordinators fire updates to the database.

3. 	Worker - Reads policy.xml file. Receives request, retrieves the needed 
	attributes from database and applies the policy rules on the request.
	It sends the result of evalution to coordinator, the attributes to be 
	updated if any and the attributes read.

4.  Database Emulator - Initializes an in memory database from a init xml file.
	It serves the queries issued by worker with a response that contains values 
	for the asked attributes for a given entity(subject or resource)

5.  Master - Responsible to receive completion alerts from the clients.

6.  For simplicity of this project, all the processes are initialized from the
	single main funciton in master.da file




