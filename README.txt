********Distributed Policy Evaluation Engine********************************

This is a da(python) based implementation of horizontally scaled distributed
policy evaluation engine.
****************************************************************************

INSTRUCTIONS - HOW TO RUN?
1.	Type make in the main directory to build the code.

2.	Type make ARG=(NAME_OF_CONFIG_FILE) run to run the code with a specific
	configuration. This configuration is specified in a config file which
	is supplied the placeholder NAME_OF_CONFIG_FILE. There is one sample
	config file in config directory. There are many test cases config files

MAIN FILES:
1. 	client.da - Process to send request and receive a response. This process directly
	sends the rquest to subject coordianator and receives a evaluation response
	to its request

2.	coordinator.da - Coordinator process can be a subject coordinator or resource 
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

3. 	worker.da - Reads policy.xml file. Receives request, retrieves the needed 
	attributes from database and applies the policy rules on the request.
	It sends the result of evalution to coordinator, the attributes to be 
	updated if any and the attributes read.

4.  database.da - Initializes an in memory database from a init xml file.
	It serves the queries issued by worker with a response that contains values 
	for the asked attributes for a given entity(subject or resource)

5.  master.da- Responsible to receive completion alerts from the clients.
	For simplicity of this project, all the processes are initialized from the
	single main funciton in master.da file

6. common.da - Definitions of datastructures like Requst, Response, Database
	response


BUGS AND LIMITATIONS - As per the requirement of [Decat+ 2015], our implementation
	doesn't pose any limitations. We would be happy to discuss should someone
	report any.

CONTRIBUTIONS - 
	SHAHZEB PATEL:
	1. Initial process stubs and for each of the processes
	2. Message massping - Implementation of exchanging the request and responses 
		objects across each process. Processing them in receive callbacks as per
		the algorithm (pseudocode)
	3. Caching implementation - Preserve tentative and/or valid updates across 
		subject and resource coordinators and use them for conflict resolution
	4. Response queueing mechanism to delay the response processing because
		of any dependency and process such responses in the order for which
		their requests came
	5. Conflict resolution - Conflict resolution using timestamps on subject 
		and resource coordinators. If the conflict arises then restarting
		the request. Dependent request are eventually restarted
	6. User specified request generation from the client side. The sequence is
		specified in config files
	7. Integrating logging module, config parser modules
	8. Initialize database from the initial files
	9. Testing of the above implementation and logging for implemented code

	AADARSH JAJODIA:
	1. Reading policy defintion from xml file and storing in a format eligible
		to apply it on request
	2. Database emulator to receive requests from populate the response for 
		the requested queries
	3. Send the database commits from cooridinator, receive them on database side
		and process it according to calculated db latency into the in memory database
	4. Apply the policy on any incoming request and provide the result to
		subject coordinator
	5. Serializers for every data structures to be printed on the log messages
	6. Pseudo random sequence based request generation in client
	8. Testing of above implementations and logging for implemented code


OTHER COMMENTS:
	Every single detail of the process (what's happening is logged). This can be seen
	by switching to DEBUG log in the config file. Else minimal logging is turned on
	by default