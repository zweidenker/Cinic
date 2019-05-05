I'm a Configuration holding access to static and dynamic configuration elements.

Loading
=======

	config := Configuration readFileNamed: 'config.json'.
	config apply.
	
Global use: 
===========

A configuration can be made globally available by issuing 

	aConfiguration beDefault
	
Code can then access 
	
	Confguration default 
	
Script usage
============

Taken a confguration of

	{ "server" : { "port" : 8080 } }

a configuration script can be written like this

	#server sectionDo: [ :config |
		ZnServer on: config port. ].

In-Image usage 
==============

Components can be annotated using pragmas 

	myConfiguration
		<configurationStep>
		^ ConfigurationStep new
			group: #server;
			action: [ :config | MyServer port: config port ].
			
In order to apply the configuration to the image you need to evaluate 

	aConfiguration apply 
	
once