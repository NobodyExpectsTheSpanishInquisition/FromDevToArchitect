# C4 Model Topic Abbreviation

<!-- TOC -->
* [C4 Model Topic Abbreviation](#c4-model-topic-abbreviation)
    * [Resources:](#resources)
  * [Introduction](#introduction)
  * [Abstraction](#abstraction)
    * [Most Common Abstractions](#most-common-abstractions)
  * [4 levels of complexity](#4-levels-of-complexity)
    * [1-Level - System context](#1-level---system-context)
    * [2-Level - Container](#2-level---container)
    * [3-Level - Component](#3-level---component)
    * [4-Level - Code](#4-level---code)
<!-- TOC -->

### Resources:

- [LINK TO C4 MODEL OFFICIAL PAGE](https://c4model.com/) - All information and images comes from here!

## Introduction

_"The C4 model was created as a way to help software development teams describe and communicate software architecture,
both during up-front design sessions and when retrospectively documenting an existing codebase. It's a way to create
maps of your code, at various levels of detail, in the same way you would use something like Google Maps to zoom in and
out of an area you are interested in."_

## Abstraction

In order to create readable scheme of our Application we need to provide common set of abstractions to create a
ubiquitous language, which we will operate.

### Most Common Abstractions

- **Software system** - _"A software system is the highest level of abstraction and describes something that delivers
  value to its users, whether they are human or not. This includes the software system you are modelling, and the other
  software systems upon which your software system depends (or vice versa)."_
- **Container**

"Not Docker! In the C4 model, a container represents an application or a data store. A container is something that needs
to be running in order for the overall software system to work. In real terms, a container is something like":

- Server-side web application: A Java EE web application running on Apache Tomcat, an ASP.NET MVC application running on
  Microsoft IIS, a Ruby on Rails application running on WEBrick, a Node.js application, etc.
- Client-side web application: A JavaScript application running in a web browser using Angular, Backbone.JS, jQuery,
  etc.
- Client-side desktop application: A Windows desktop application written using WPF, an OS X desktop application written
  using Objective-C, a cross-platform desktop application written using JavaFX, etc.
- Mobile app: An Apple iOS app, an Android app, a Microsoft Windows Phone app, etc.
- Server-side console application: A standalone (e.g. "public static void main") application, a batch process, etc.
- Serverless function: A single serverless function (e.g. Amazon Lambda, Azure Function, etc).
- Database: A schema or database in a relational database management system, document store, graph database, etc such as
  MySQL, Microsoft SQL Server, Oracle Database, MongoDB, Riak, Cassandra, Neo4j, etc.
- Blob or content store: A blob store (e.g. Amazon S3, Microsoft Azure Blob Storage, etc) or content delivery network (
  e.g. Akamai, Amazon CloudFront, etc).
- File system: A full local file system or a portion of a larger networked file system (e.g. SAN, NAS, etc).
- Shell script: A single shell script written in Bash, etc.
- etc

A container is essentially a context or boundary inside which some code is executed or some data is stored. And each
container is a separately deployable/runnable thing or runtime environment, typically (but not always) running in its
own process space. Because of this, communication between containers typically takes the form of an inter-process
communication.

- **Component** - "If you're using a language like Java or C#, the simplest way to think of a component is that it's a
  collection of implementation classes behind an interface.".
- **Code elements** - classes, interfaces, objects, functions, etc...
- **People** - Users

![C4 Model Abstraction](https://c4model.com/img/abstractions.png)
source: https://c4model.com/img/abstractions.png

## 4 levels of complexity

### 1-Level - System context

_"A System Context diagram provides a starting point, showing how the software system in scope fits into the world
around it."_

![System Context Example](https://static.structurizr.com/workspace/76748/diagrams/SystemContext.png)
source: https://static.structurizr.com/workspace/76748/diagrams/SystemContext.png

### 2-Level - Container

_"A Container diagram zooms into the software system in scope, showing the high-level technical building blocks."_

![Container example](https://static.structurizr.com/workspace/36141/diagrams/Containers.png)
source: https://static.structurizr.com/workspace/36141/diagrams/Containers.png

### 3-Level - Component

_"A Component diagram zooms into an individual container, showing the components inside it."_

![Component example](https://static.structurizr.com/workspace/76749/diagrams/Components.png)
source: https://static.structurizr.com/workspace/76749/diagrams/Components.png

### 4-Level - Code

_"A code (e.g. UML class) diagram can be used to zoom into an individual component, showing how that component is
implemented."_

![Code Example](https://c4model.com/img/class-diagram.png)
source: https://c4model.com/img/class-diagram.png 


