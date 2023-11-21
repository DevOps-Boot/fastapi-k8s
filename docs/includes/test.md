# Testing and demonstration page


## Glossary


### Terms definitions


#### Default section

parent_term
:   Parent term definition

    nested_term
    :   Nested term definition

myterm
:   Myterm tests default glossary section

`formated_term`
:   Formated term definition


#### Named section ('test')

test:pipo
:   Our faithfull `pipo` option

test:`mycommand`
:   Our faithfull `pipo` option

terms:kubernetes
:   Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications.


### Terms reference

Testing glossary <test:pipo> tooltips and referencing <:myterm> <_:myterm> default section term.


### Auto generated glossary


#### Test section

<glossary::test|theme=detailed>


#### Default section

<glossary::_|theme=detailed>


## Diagrams

### Kroki

* [mkdocs-kroki-plugin](https://github.com/AVATEAM-IT-SYSTEMHAUS/mkdocs-kroki-plugin)
* [Diagram types](https://kroki.io/#support)

### From file

#### NwDiag

```kroki-nwdiag
@from_file:assets/diagrams/kroki-sample.nwdiag
```

### Block

#### PlantUML

```kroki-plantuml no-transparency=false
@startmindmap
skinparam monochrome true
+ OS
++ Ubuntu
+++ Linux Mint
+++ Kubuntu
+++ Lubuntu
+++ KDE Neon
++ LMDE
++ SolydXK
++ SteamOS
++ Raspbian
-- Windows 95
-- Windows 98
-- Windows NT
--- Windows 8
--- Windows 10
@endmindmap
```

#### Mermaid

```kroki-mermaid
gantt
    title A Gantt Diagram
    dateFormat  YYYY-MM-DD
    section Section
    A task           :a1, 2014-01-01, 30d
    Another task     :after a1, 20d
    section Another
    Task in sec      :2014-01-12, 12d
    another task     :24d
```

#### d2

```kroki-d2
shape: sequence_diagram
Alice -> John: Hello John, how are you?
Alice -> John.ack: John, can you hear me?
John.ack -> Alice: Hi Alice, I can hear you!
John -> Alice: I feel great!
```
