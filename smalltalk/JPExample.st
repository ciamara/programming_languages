<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.3 of July 28, 2017 on November 16, 2024 at 23:05:03</time-stamp>


<component-created>
<name>JPExample</name> <type>package</type>
</component-created><!-- Package JPExample* -->


<component-created>
<name>JPExample</name> <type>package</type>
</component-created>

<class>
<name>Wielokat</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wierzcholki nazwa okrag </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>JPExample</package>
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
<package>JPExample</package>
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
<package>JPExample</package>
</attributes>
</class>

<class>
<name>Okrag</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>promien srodek </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>JPExample</package>
</attributes>
</class>

<methods>
<class-id>Wielokat</class-id> <category>getOkrag</category>

<body package="JPExample" selector="getOkrag">getOkrag	^okrag</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>accessing</category>

<body package="JPExample" selector="nazwa">nazwa	"podaje nazwe wielokata"	^nazwa</body>

<body package="JPExample" selector="nazwa:">nazwa: nowa_nazwa	"ustawia nowa nazwe wielokata"	nazwa:=nowa_nazwa</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>wpiszOkrag</category>

<body package="JPExample" selector="wpiszOkrag">wpiszOkrag    "metoda abstrakcyjna"    self shouldNotImplement.</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>skaluj</category>

<body package="JPExample" selector="skaluj:">skaluj: liczba    "skaluje boki ksztaltu przez : liczba"    	wierzcholki := wierzcholki collect: [:side | side * liczba].		Transcript show: 'Przeskalowano figure: '.	Transcript show: self nazwa.	Transcript show: ', o skale : '.	Transcript show: liczba printString.	Transcript show: '';cr.</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>initialize-release</category>

<body package="JPExample" selector="initialize:name:">initialize: liczbaWierzcholkow name: nowaNazwa	"konstruktor obiektu - wielokata"	nazwa:=nowaNazwa.	wierzcholki:=Array new: liczbaWierzcholkow.	wierzcholki at: 1 put: 0@0.	okrag:=nil</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>drukuj</category>

<body package="JPExample" selector="drukuj">drukuj    "drukowanie wierzcholkow + pole"	Transcript show: 'Wielokat:'; cr.    Transcript show: '    Wierzcholki: ', wierzcholki printString; cr.    Transcript show: '    Pole: ', (self pole printString); cr.</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>pole</category>

<body package="JPExample" selector="pole">pole    "metoda abstrakcyjna"    self shouldNotImplement.</body>
</methods>


<methods>
<class-id>Kwadrat</class-id> <category>wpiszOkrag</category>

<body package="JPExample" selector="wpiszOkrag">wpiszOkrag	| pr x_o y_o |	pr := (((wierzcholki at: 2) x - (wierzcholki at: 1) x) abs) / 2.	x_o := ((wierzcholki at: 1) x) + pr.	y_o := ((wierzcholki at: 1) y) + pr.	okrag := (Okrag new) initialize: pr srodek: ((Array new:1) at: 1 put: (x_o)@(y_o)).</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>skaluj</category>

<body package="JPExample" selector="skaluj:">skaluj: liczba	super skaluj: liczba.		((okrag isNil)		ifFalse: [			self wpiszOkrag.		]).</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>actions</category>

<body package="JPExample" selector="pole">pole	"licz pole kwadratu"	^((wierzcholki at: 2) x - (wierzcholki at: 1) x) squared</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>arithmetic</category>

<body package="JPExample" selector="+">+ figura	"dodaj 2 figury w sensie pola"	| p |	p:=self pole + figura pole.	^(Kwadrat new) initialize: p sqrt</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>initialize-release</category>

<body package="JPExample" selector="initialize:">initialize: bok	"tworz kwadrat o podanym boku"	super initialize: 4 name: 'Kwadrat'.	wierzcholki at: 2 put: bok@0.	wierzcholki at: 3 put: bok@bok.	wierzcholki at: 4 put: 0@bok.</body>
</methods>


<methods>
<class-id>Trojkat_rownoramienny class</class-id> <category>instance creation</category>

<body package="JPExample" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>setPodstawa</category>

<body package="JPExample" selector="setPodstawa:">setPodstawa: pod	podstawa:= pod.</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>arithmetic</category>

<body package="JPExample" selector="+">+ figura	"dodaj 2 figury w sensie pola"	| p skala nowa_podstawa nowa_wysokosc |	p:=self pole + figura pole.		skala := (p / self pole) sqrt.		nowa_podstawa := podstawa * skala.      nowa_wysokosc := wysokosc * skala.		^(Trojkat_rownoramienny new) initialize: nowa_podstawa wysokosc: nowa_wysokosc</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>setWysokosc</category>

<body package="JPExample" selector="setWysokosc:">setWysokosc: wys	wysokosc:= wys.</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>wpiszOkrag</category>

<body package="JPExample" selector="wpiszOkrag">wpiszOkrag	| pr x_o y_o |		pr:=(podstawa*wysokosc)/(podstawa+(4*(wysokosc squared)+(podstawa squared))sqrt).	x_o:=((wierzcholki at: 1) x) + (podstawa / 2).	y_o:=((wierzcholki at: 1) y) + pr.		okrag:=(Okrag new) initialize: pr srodek: ((Array new:1) at: 1 put: (x_o)@(y_o))</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>actions</category>

<body package="JPExample" selector="pole">pole	"licz pole trojkata rownorammiennego"	^ (podstawa * wysokosc) / 2.</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>initialize-release</category>

<body package="JPExample" selector="initialize:wysokosc:">initialize: pod wysokosc: wys	"tworz trojkat rownoramienny o podanej podstawie i wysokosci"		self setPodstawa: pod.    self setWysokosc: wys.	super initialize: 3 name: 'Trojkat_rownoramienny'.	wierzcholki at: 2 put: podstawa@0.	wierzcholki at: 3 put: (podstawa / 2)@wysokosc.</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>getPodstawa</category>

<body package="JPExample" selector="getPodstawa">getPodstawa	^podstawa.</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>getWysokosc</category>

<body package="JPExample" selector="getWysokosc">getWysokosc	^wysokosc.</body>
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>skaluj</category>

<body package="JPExample" selector="skaluj:">skaluj: liczba  "skaluje boki trojkata przez : liczba"    wierzcholki := wierzcholki collect: [:side | side * liczba].      "skalowanie podstawy i wysokosci"       self setPodstawa: (self getPodstawa * liczba).       self setWysokosc: (self getWysokosc * liczba).		   ((okrag isNil)		ifFalse: [			self wpiszOkrag.		]).		Transcript show: 'Przeskalowano figure: '.	Transcript show: self nazwa.	Transcript show: ', o skale : '.	Transcript show: liczba printString.	Transcript show: '';cr.</body>
</methods>


<methods>
<class-id>Okrag class</class-id> <category>instance creation</category>

<body package="JPExample" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Okrag</class-id> <category>setPromien</category>

<body package="JPExample" selector="setPromien:">setPromien: pr	promien:=pr.</body>
</methods>

<methods>
<class-id>Okrag</class-id> <category>setSrodek</category>

<body package="JPExample" selector="setSrodek:">setSrodek: sr	srodek := sr.</body>
</methods>

<methods>
<class-id>Okrag</class-id> <category>initialize-release</category>

<body package="JPExample" selector="initialize:srodek:">initialize: pr srodek: sr	"tworz okrag o podanym promieniu i srodku"	srodek:=Array new: 1.	self setSrodek: sr.	self setPromien: pr.</body>
</methods>

<methods>
<class-id>Okrag</class-id> <category>drukuj</category>

<body package="JPExample" selector="drukuj">drukuj	"drukowanie srodka i promienia okregu"	Transcript show: 'Okrag:'; cr.	Transcript show: '    Srodek: ', srodek printString; cr.	Transcript show: '    Promien: ', promien printString; cr.</body>
</methods>

<methods>
<class-id>Okrag</class-id> <category>getPromien</category>

<body package="JPExample" selector="getPromien">getPromien	^promien</body>
</methods>

<methods>
<class-id>Okrag</class-id> <category>getSrodek</category>

<body package="JPExample" selector="getSrodek">getSrodek	^srodek</body>
</methods>



</st-source>
