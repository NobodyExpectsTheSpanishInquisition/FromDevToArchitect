# Software Architecture Patterns - Mark Richards - Abbreviation

[LINK](https://ae.oreilly.com/l/1009792/2023-05-26/gw54/1009792/1685141235Z8bRQIn3/Software_Architecture_Patterns.pdf)

## Architecture style != Architecture pattern

Architecture Style - Event Driven Architecture (EDA)
Architecture Pattern - CQRS

## Architecture classification

### Monolithic - single deployment unit

Pro:

- Simplicity
- Low deployment costs

Cons:

- Fault tolerance
- Scalability
- Elasticity

### Distributed - multiple deployment units, usually consisting of services

Pro:

- Fault tolerance
- Scalability
- Elasticity
- Agility - the ability to respond quickly to change
- Easier to locate and apply change
- Smaller testing scope
- Reduced deployment risk

Cons:

- Complex
- Higher deployment costs
- Networks do fail
- Bandwidth is not infinite
- Latency is not zero

#### Architecture partitioning

Architectures can be technical or domain partitioned.

### Layered Architecture

- Components within the layered architecture style are organized
  into horizontal layers, each performing a specific role within the
  application
- Each layer in the architecture forms an abstraction around the work
  that needs to be done to satisfy a particular business request.
- A closed layer means that as a request moves from layer to
  layer, it must go through the layer right below it to get to the next
  layer below that one. For example, a request originating from the
  presentation layer must first go through the business layer and then
  to the persistence layer before finally hitting the database layer.
- **Architecture sinkhole anti-pattern** - requests are passed through layers without any manipulation, calculation
  or transform.

### Mikrokernel Architecture (Plug-in Architecture)

- Consist of two parts:
    - Core
    - Plug-in modules
- Application logic is divided between independent plug-in modules and the
  basic core system, providing extensibility, flexibility, and isolation
  of application features and custom processing logic.

#### Core

- Holds minimum of functionality, only to make system operational.
- Should know which plugins are available and how to get them (plugins registry)

#### Plug-in modules

- Plug-ins are independent application's components containing separated functionalities.
- Communication between plugins should be kept on minimum level to avoid confusing dependency issues.
- Should be registered in for example **Plugin Registry**, which will includes data like **_name_**, **_contract
  details_**, **_remote access protocol details_**
- Plug-in modules can be connected to the core system in a variety of
  ways. Traditionally, plug-ins are implemented as separate libraries or
  modules (such as JAR and DLL files) connected in a point-to-point
  fashion (such as a method call via an interface).
- In monolithic architecture common way of plugin access is dropping a file to particular directory and restart of
  application.
- Another way of plugins deployment is implementing them as separated services [_looks similar to microservices_]
  and access to them by REST or messaging systems (e.g. rabbit, kafka)

#### Summary

Mikrokernel architecture is good to consider as starting point for product-based or custom application. It will
allow us to provide new functionalities in fast and flexible way with minimum affect of application core. All requests
must go through the core system, regardless of whether
the plug-ins are remote or point-to-point invocations. Because of this, the core system acts as the main bottleneck
to this architecture, and is not well suited for highly scalable and elastic systems.

### Event Driven Architecture

#### Topology

Event driven architecture relies on asynchronous processed events and correspondingly respond to events happening in
the system.

- Event processor - Today called a **service**, is responsible for handling events.
- Initiating event - An event, which happens in order to external behaviours. It often starts the chain on events.
- Processing event - Is a response on changing the state of application. The relation between **Initiating event**
  and **Processing event** is **one-to-many**. One **Initiating event** may spawn many different **processing events**.
- Event channel - Is a physical way to store events. Like queue or topic.

#### Event-Driven vs Message-Driven

The main difference between **Events** and **Messages** is that, events corresponds on something that happened in
the system. Meanwhile, messages are something like requests for certain services to do something.
The second difference is the owning of channels. With events the sender owns the channel, but with messages the
receiver owns the channel.

### Microservices architecture

_"The microservices architecture style is an ecosystem made up of single-purpose, separately deployed services that are
accessed typically through an API gateway."_

- Each microservice has its own data storage (separated databases or tables collection in single database).
- Only service that owns the data storage can manipulate or read the data.
- Main purpose of API gateway is to hide microservices implementation and location.
- API gateway also can secure the services, gather metrics and so on.
- API Gateway cannot contain any logic, just forward the requests.
- Each microservice should do only one thing. Size does not matter, matters the purpose.
- Purpose of microservice is known as _**bounded context**_. This term comes from Eric Evans's book _Domain-Driven
  Design_. This means that source code representing concrete logic is encapsulated in single microservice.
- Microservices require an automation for testing, deployment or monitoring.
- For work on microservices teams should be organized as cross-functional, divided by domain, not infrastructure.
- This architectural style should be considered when application needs fast response for need of change.
- Microservices are also good choice when you have high fault tolerance or need of scalability.
- If you need high performance microservices are not the best choice. There are 3 types of potentially latency:
    - Data Latency - time to collect data from other services.
    - Network Latency - time to deliver the package.
    - Security latency - time to authenticate/authorize.

### Space-based Architecture

_"Most web-based business applications follow the same general
request flow: a request from a web browser is received by a web
server, then an application server, then finally a database server.
While this type of request flow works great for a small number of
users, bottlenecks start appearing as the user load increases, first
at the web server, then at the application server, and finally at the
database"_

Every layer may experience a bottlenecks. The first solution you may think about is scaling, but scaling web servers
will move bottlenecks to application layer. Scaling application layer will move bottleneck to database layer. The
lower will we go, the bigger costs will we have. And this will give us **triangle-shaped topology**.
In every high-volume application the final limiting factor will be database, which is the hardest to scale.

_"The space-based architecture is designed to address and solve those sorts of high scalability and concurrency issues.
It is also a useful architecture style for applications that have variable and
unpredictable concurrent user volumes (known as elastic systems)."_

#### Topology

- Space-based Architecture characterize itself by moving database layer to asynchronous background.
- Real-time data are stored in in-memory storage
- Data are synchronized in async eg. Queues
- This style gets its name from computer science term _tuple space_ - the concept of multiple parallel processors
  with shared memory.
- Processing units can be dynamically started up and shut down as user load increases and decreases, thereby
  addressing variable scalability.
- Services in this architecture style are formally referred to as _processing units_.

#### Processing units

- A processing unit contains business functionality varies in granularity from a single-purpose function to the entire
  application functionality.
- Each processing unit contains business logic and an in-memory data grid.
- Processing units can communicate with each other directly or via processing grid of the _virtualized middleware_.

#### Virtualized middleware

This middleware manages such things as request and session management, data synchronization, communication and
orchestration between processing units, and the dynamic tearing down and starting up of processing units to manage
elasticity and user load.

In Virtualized middleware there are four main components:

- **Messaging grid** - Manages input requests and session information.
- **Data grid** - The data grid interacts with the data-replication engine in each processing unit to manage the
  data replication between processing units when data updates occur. An additional element of **Data grid** is
  **data pump** which, manages data synchronization to main database.
- **Processing grid** - The processing grid component of the virtualized middleware is an optional component that
  manages distributed processing for requests that require coordination or orchestration between processing unit
  types.Orchestration between multiple processing units can be coordinated through the processing grid, or directly
  between processing units in a choreographed fashion.
- **Deployment manager** - manages the dynamic startup and shutdown of processing units based on load conditions.This
  component continually monitors response times and user
  loads, starts up new processing units when the load increases, and shuts down processing units when the load
  decreases. It is a critical component to achieving variable scalability needs within an application, and is usually
  implemented through container orchestration products such as **Kubernetes**

_"Space-based architecture is a complex and expensive style to implement. As such, it’s not suitable as a
general-purpose
architecture...Rather, it’s meant for specific situations such as high scalability, high elasticity, and high 
performance"_


