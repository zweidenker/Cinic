
[![Build Status](https://travis-ci.org/zweidenker/Configurator.svg?branch=master)](https://travis-ci.org/zweidenker/Configurator)

# Installation:

Cinic is a [Pharo](https://pharo.org/) library that aims to help managing external configuration files.  
It can be loaded into a pharo image with:  

```smalltalk
Metacello new
    	repository: 'https://github.com/zweidenker/Cinic:0.2.1’;
    	baseline: 'Cinic';
    	load
```


While the model of Cinic is format-agnostic,  
the current implemented parser expects a configuration to comes in the form of a JSON file.  
The parser could later be extended to other formats if needed.  
 

Here is a contents example of such a configuration file:

```
{ 
	“section1” :
		{
			“property1” :  “value1” 
		} ,
	“section2” :
		{
			“section21” :
				{
					“property2” : “value2”
				{			
		}
}
```

# Loading configuration files:

A configuration file can be loaded by executing:  

```smalltalk
config := Cinic readFileNamed: 'config.json'.
```

The resulting Cinic object will be the entry point for traversing the imported configuration.  

# Model:

Cinic models configuration as a tree of Sections.  
The root Section represents the root of the configuration file.  
Sections can be nested without limitations.  

Regarding the implementation, a Section object is nothing more than a specialised Dictionary object.  
Its keys are property or section names,  
Its values are property values or Section objects.   

# Scripting actions:

In order to act upon a configuration, Cinic provides some scripting facilities.  
After loading the above configuration example, one could excecute:  

```smalltalk
#section1 sectionIn: config do: [ :aSection |
	Transcript show: aSection property1
	].
#section2 sectionIn: config do: [ :aSection |
	#section21 sectionIn: aSection do: [:aNestedSection |
		Transcript show: aSection property2
		]
	].
```

Note that property names can be turned into messages send to a Section object.  
Cinic will automatically "translate" such unknown messages, and made them return the associated property value.  

When iterating over inner sections of a configuration, Cinic will store the current section in a dynamic variable.  
The above script can then be simplified as:  

```smalltalk
#section2 sectionIn: config do: [ :aSection |
	#section21 sectionDo: [:aNestedSection |
		Transcript show: aSection property2
		]
	].
```

# Implementing actions:

An alternative to scripting configuration actions is to implement them as method.  
This may be useful if you want to share a common action behaviour between multiple kind of configurations.  
This can be done by using Steps. 

## Steps definition

A Step knows about a Section path and an action block.   
The action block is expected to be executed with an associated Section object as argument:  

```smalltalk
CinicStep new
			section: #section1;
			action: [ :aSection1 | Transcript show: aSection1 property1 ].
```

A Step is intended to be returned by methods providing a `<cinicStep>` pragma:  
  
```smalltalk
section21SetUp
		<cinicStep>
    ^ CinicStep new
			  section: #section21;
			  action: [ :aSection21 | Transcript show: aSection property2 ].
```
  
## Steps execution  
  
After loading a configuration, one can execute the Steps associated to this configuration by executing . 
  
```smalltalk
config := Cinic readFileNamed: 'config.json'.
config apply.
```

When applying a configuration, Cinic will gather all methods in the pharo image with pragma `<cinicStep>`.  
It will select the steps matching a section path in the configuration, and execute them.  

The steps will be executed in the same order than the file sections order.  


## Steps section path

The above example shows the case of a "standalone" section: #section21.  
As soon as a configuration file includes a section with name #section21, the Step will be executed.  
But a Step could also target a more precise section path: 

```smalltalk
section1SetUp
		<cinicStep>
    ^ CinicStep new
			  sectionPath: #(section2 section21);
			  action: [ :aSection21 | Transcript show: aSection property1 ].
```

In this case, the Step would be executed only if the configuration file provide a section with name #section2,   
followed by a section with name #section21.    
The block would be evaluated with the #section21 associated object.  

# Global use:

After being loaded, a configuration can also be made globally available in the Pharo image with:  

```smalltalk
config beDefault
```

Code can then access   

```smalltalk
Cinic default 
```





