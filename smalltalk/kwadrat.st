<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.3 of July 28, 2017 on November 2, 2024 at 1:18:11 PM</time-stamp>


<component-created>
<name>example</name> <type>package</type>
</component-created><!-- Package example* -->


<component-created>
<name>example</name> <type>package</type>
</component-created>

<class>
<name>Wielokat</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wierzcholki nazwa </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>example</package>
</attributes>
</class>

<class>
<name>Kwadrat</name>
<environment>Smalltalk</environment>
<super>Wielokat</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>example</package>
</attributes>
</class>

<class>
<name>Trojkat_rownoramienny</name>
<environment>Smalltalk</environment>
<super>Wielokat</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>podstawa wysokosc </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>example</package>
</attributes>
</class>

<methods>
<class-id>Wielokat</class-id> <category>initialize-release</category>

<body package="example" selector="initialize:name:">initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"

	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>accessing</category>

<body package="example" selector="nazwa:">nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa</body>

<body package="example" selector="nazwa">nazwa
	"podaje nazwe wielokata"

	^nazwa</body>
</methods>


<methods>
<class-id>Kwadrat</class-id> <category>actions</category>

<body package="example" selector="pole">pole
	"licz pole kwadratu"

	^(wierzcholki at: 2) x squared</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>arithmetic</category>

<body package="example" selector="+">+ figura
	"dodaj 2 figury w sensie pola"

	| p |

	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>initialize-release</category>

<body package="example" selector="initialize:">initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.</body>
</methods>


<methods>
<class-id>Trojkat_rownoramienny class</class-id> <category>instance creation</category>

<body package="example" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>actions</category>

<body package="example" selector="pole">pole
	"licz pole trojkata rownorammiennego"

	^ (podstawa * wysokosc) / 2</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>arithmetic</category>

<body package="example" selector="+">+ figura
	"dodaj 2 figury w sensie pola"

	| p skala nowa_podstawa nowa_wysokosc |

	p:=self pole + figura pole.
	
	skala := (p / self pole) sqrt.
	
	nowa_podstawa := podstawa * skala.
      nowa_wysokosc := wysokosc * skala.
	
	^(Trojkat_rownoramienny new) initialize: nowa_podstawa wysokosc: nowa_wysokosc</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>initialize-release</category>

<body package="example" selector="initialize:wysokosc:">initialize: podstawa wysokosc: wysokosc
	"tworz trojkat rownoramienny o podanej podstawie i wysokosci"

	super initialize: 3 name: 'Trojkat_rownoramienny'.
	wierzcholki at: 2 put: podstawa@0.
	wierzcholki at: 3 put: (podstawa / 2)@wysokosc.</body>
</methods>



</st-source>
