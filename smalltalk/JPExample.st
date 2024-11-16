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

<body package="JPExample" selector="getOkrag">getOkrag
</methods>

<methods>
<class-id>Wielokat</class-id> <category>accessing</category>

<body package="JPExample" selector="nazwa">nazwa

<body package="JPExample" selector="nazwa:">nazwa: nowa_nazwa
</methods>

<methods>
<class-id>Wielokat</class-id> <category>wpiszOkrag</category>

<body package="JPExample" selector="wpiszOkrag">wpiszOkrag
</methods>

<methods>
<class-id>Wielokat</class-id> <category>skaluj</category>

<body package="JPExample" selector="skaluj:">skaluj: liczba
</methods>

<methods>
<class-id>Wielokat</class-id> <category>initialize-release</category>

<body package="JPExample" selector="initialize:name:">initialize: liczbaWierzcholkow name: nowaNazwa
</methods>

<methods>
<class-id>Wielokat</class-id> <category>drukuj</category>

<body package="JPExample" selector="drukuj">drukuj
</methods>

<methods>
<class-id>Wielokat</class-id> <category>pole</category>

<body package="JPExample" selector="pole">pole
</methods>


<methods>
<class-id>Kwadrat</class-id> <category>wpiszOkrag</category>

<body package="JPExample" selector="wpiszOkrag">wpiszOkrag
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>skaluj</category>

<body package="JPExample" selector="skaluj:">skaluj: liczba
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>actions</category>

<body package="JPExample" selector="pole">pole
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>arithmetic</category>

<body package="JPExample" selector="+">+ figura
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>initialize-release</category>

<body package="JPExample" selector="initialize:">initialize: bok
</methods>


<methods>
<class-id>Trojkat_rownoramienny class</class-id> <category>instance creation</category>

<body package="JPExample" selector="new">new
</methods>


<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>setPodstawa</category>

<body package="JPExample" selector="setPodstawa:">setPodstawa: pod
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>arithmetic</category>

<body package="JPExample" selector="+">+ figura
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>setWysokosc</category>

<body package="JPExample" selector="setWysokosc:">setWysokosc: wys
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>wpiszOkrag</category>

<body package="JPExample" selector="wpiszOkrag">wpiszOkrag
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>actions</category>

<body package="JPExample" selector="pole">pole
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>initialize-release</category>

<body package="JPExample" selector="initialize:wysokosc:">initialize: pod wysokosc: wys
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>getPodstawa</category>

<body package="JPExample" selector="getPodstawa">getPodstawa
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>getWysokosc</category>

<body package="JPExample" selector="getWysokosc">getWysokosc
</methods>

<methods>
<class-id>Trojkat_rownoramienny</class-id> <category>skaluj</category>

<body package="JPExample" selector="skaluj:">skaluj: liczba
</methods>


<methods>
<class-id>Okrag class</class-id> <category>instance creation</category>

<body package="JPExample" selector="new">new
</methods>


<methods>
<class-id>Okrag</class-id> <category>setPromien</category>

<body package="JPExample" selector="setPromien:">setPromien: pr
</methods>

<methods>
<class-id>Okrag</class-id> <category>setSrodek</category>

<body package="JPExample" selector="setSrodek:">setSrodek: sr
</methods>

<methods>
<class-id>Okrag</class-id> <category>initialize-release</category>

<body package="JPExample" selector="initialize:srodek:">initialize: pr srodek: sr
</methods>

<methods>
<class-id>Okrag</class-id> <category>drukuj</category>

<body package="JPExample" selector="drukuj">drukuj
</methods>

<methods>
<class-id>Okrag</class-id> <category>getPromien</category>

<body package="JPExample" selector="getPromien">getPromien
</methods>

<methods>
<class-id>Okrag</class-id> <category>getSrodek</category>

<body package="JPExample" selector="getSrodek">getSrodek
</methods>



</st-source>