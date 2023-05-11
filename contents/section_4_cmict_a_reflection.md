---
bibliography: ['../ref.bib']
---


 <!-- with a server module as backend, a client module as frontend, and a simulation module. -->

CMICT Data Dashboard & Simulation Project: A Engineering Perspective Reflection
======

In the year 2022-2023, I participated the Ningbo Daxie China Merchants International Container Terminal(CMICT) Data Dashboard and Simulation project. This horizontal project 
is aiming to build a data monitoring dashboard and simulation to assist the terminal operator to have one-step view on
the terminal devices with KPI, as well as predict future terminal status by simulation. This project is aiming to 
build a solid cooperation basis between the UNNC Digital Port Lab and CMICT. I am mainly responsible for the monitoring backend and data 
adaptor module development. In some certain situations, I also participated in other works including requirement engineering, UI design and 
project management. In this part, I will first briefly introduce the project background, and then talk about the developed system. Since the project last
for almost one year which is beyond the prediction, I will then describe the whole development process with reflection. Finally, I
will summarize the experience that our team gained and gives some general guidelines on how such business-oriented horizontal project should be operated
in future.


## Project Introduction

<!-- This section will briefly introduce the project. -->

### Ningbo Daxie China Merchants International Container Terminal(CMICT)
Ningbo Daxie China Merchants International Container Terminal(CMICT)[@cmictNINGBODAXIECHINA2023] is located at Beilun District, Ningbo city.
CMICT has 4 container ship berths with corresponding facilities, which can serve up to 2 million tons vessels.
The terminal is built and put into use with a yard and road area of 839,000 square metres. The design capacity of the terminal 
is 2.4 million TEU per year. Recent decade witnessed a rapid growth of cargo throughout. In 2008, the throughout was about 1 million TEU.
The number grew three times, reached to 3.16 million TEU in 2018.

The terminal is highly digitalized. Most of the devices in terminal in the port, including 16 bridge cranes, 51 gantry cranes, 13 stackers, 116 
in-terminal trucks, are tracked and managed by terminal operating system (TOS). In addition, several assistant systems are deployed to 
help manage the port, including computer vision based intelligence cargo system, non-contact social truck gate tracking system, etc.  
The terminal is now seeking for cooperators that could help build intelligent terminal to improve the whole efficiency.


### Data Monitoring Dashboard and Discrete Event Simulation

Data monitoring dashboard is a tool of visualizing business data and key performance indicator(KPI) that gives manager a clear view of system.
[@freiManagementCockpitsConcept2016]
As a useful facility for support decision-making, data dashboard provides a one-step view of critical statistics.  
A data dashboard has two major application: 1) help operators to build overview of system or business, therefore let the business growth or essential 
system faults could be identified. 2) display pre-processed measure for decision maker or stakeholders to understand business.
Specifically, the port data monitoring dashboard is a IoT-oriented dashboard, which is mainly used to display the device information and related KPI.
CMICT requires the system to be able to reflect the real-time terminal status, including the device status and KPI analysis. 

<!-- In this project, the data monitoring dashboard is used to display the position of terminal devices, including D -->

Discrete Event Simulation(DES) is a method to model real word systems. DES regards the system operation as a sequence of events in time, where each event is happened in 
a certain time point. Decision makers can predict the future system status by deduction the state changes given system behaviour modelling. 
In this project, one of the major requirement of simulation is to identify traffic jam road by extrapolating the terminal status.


### Team

The team is leaded by the Digital Port Lab in principle. During the whole development procedure, the team is mainly self-managed. 
There are 4 major members in the team, each is responsible for one certain part of project, all major members are PhD students in Digital Port Lab.
The major members include:

**Project Manager**. This role is responsible for communication, product prototype design and progress management. He is also responsible for managing   
communication documentation and meeting. Due to personal issue of team member, this role was taken by Chen Xinan before August, and then Zhou Yuyang.

**Frontend Developer**. This role is responsible for front-end development to satisfy the stakeholder's requirement, including some detailed data dashboard user interface design, 
frontend functional development, and backend interface docking. This role is taken by Zhu Junsong during the whole development progress.

**Backend Developer**. This role is responsible for back-end development, that provides pre-processed data API to frontend dashboard, and provide input/output 
communication to simulation. This work is mainly taken by me during the whole development progress.

**Simulation Developer**. This role is responsible for simulation model design and development. The work is quite idle comparing with frontend and backend development once 
input and output format is defined. This work is mainly taken by Jin Chenwei while some structure design by Jin Jiahuan.

Apart from the major member, the team involved several temporary members at some special 
time point. Those temporary members and works done will be described in development procedure.

## CMICT Port Operation Logic

Despite different type of ports exists in Ningbo, CMICT is a typical maritime container port.
A maritime container port is the transhipment where containers exchanging between container vessel and land vehicles, or between container ships happens.
As one of the most important global supply chain gateways, CMICT receives cargo from international container vessels, and dispatch them to domestic 
receivers. Besides, it also provides other derived functions such as container storage and domestic container transportation. 

Figure~\ref{fig:operation_model} briefly represents how a common container port works. 
Once a vessel arrived, it will stop at a certain berth. The quay cranes will lift the containers from the vessel then put onto an internal truck, or vice versa.
The internal trucks will carry the container between quay cranes and yards. In the yard, a yard crane will transfer the container between 
the yard and trucks. External trucks will also transfer containers between the yard after check in at the container gate. Specifically, 
the container in the yards will be reallocated due to efficiency issue. Such tasks will be executed by yard cranes and internal trucks.


<!-- LTeX: enabled=false -->
\begin{figure}[htbp]
    \label{fig:operation_model}
    \centering
    \includegraphics[]{../images/Port-Operation-Logic-SimpleLogic.pdf}
    \caption{Maritime Container Port Operation Model}
\end{figure}
<!-- LTeX: enabled=true -->

### Physical Port Area

CMICT has total 1.657 million square meters area with four deep water berths. The quay line is 1500 meters long with 17.5 meters water depth.
<!-- Figure~\ref{fig:port_area}  -->
[Figure @fig:port_area]
represents a top-down view of the port area.
The port area can be briefly divided into four parts:

1. **Quay Line**: Quay line is the place where container ship stop at. Usually the vessel is stopped at certain berth 
place according to vessel plan. The quay cranes are located at the quay line, execute container transportation
between container vessels and internal trucks. The quay lines are connected to the yard by six bridges.

2. **Yard**: Yard area stores containers for further dispatching. The yard is divided by vertical and horizontal roads which allow trucks to move. The
blocks which store containers are the areas surrounded by roads. 
The yard blocks have three types: the normal blocks, dangerous container blocks and empty container boards. A normal block is the yard that stores both
empty container and full container, which is located at the centre of yard area with standard layout. An empty container block stores empty containers only.
They have non-standard layout, located at the surrounding of normal block area. The dangerous container area stores cargos that could cause potential 
danger if not stored properly.

3. **External Truck Gateway**: The external truck gateway is located at the bottom right of the yard area. It contains two parts: the truck gateway, and a parking area for external trucks.
Once an external truck arrived, it will firstly be checked in by the gateway, then go to the park until working tasks are assigned. The external truck will then go to target 
yard to load or unload containers. 

4.  **Administration Area**: The administration area is located at the bottom of the whole port area. It contains the administration building for the whole port,
the customhouse, and container freight station. The project does not involve this area much because it does not have much influence on the whole container transportation flow.

![CMICT Port Area](../images/PortArea.pdf){#fig:port_area}

<!-- LTeX: enabled=false -->
<!-- \begin{figure}[htbp]
    \label{fig:port_area}
    \centering
    \includegraphics[]{../images/PortArea.pdf}
    \caption{CMICT Port Area}
\end{figure} -->


<!-- LTeX: enabled=true -->

### Container Transportation Equipments

Container transportation equipments are devices that executing the container transportation tasks. The container transportation task is the minimal unit in the whole port execution.
An ordinary container transportation task can be described by six elements: the container unique ID; the source and target position of the container; lifting, carrying, and putting device.
When executing an ordinary container transportation task, the container will be moved from source position to target position. The lifting device will put the container onto the carrying truck. Once the truck arrived, the 
container will be unloaded and put to target position by putting device. The start and end time of lifting, carrying and putting will be tracked and recorded. The whole 
task will not be considered as finished until the putting section ends. All devices involved in the container tasks are called container transportation equipments (CHE).
Specifically, although not owned by the port, we will include container vessels and external trucks in the discussion. There are mainly four kinds of container transportation
equipments:

- **Vessel and Quay Cranes**. When the berth is stopped at the berth assigned, it will not move until all tasks finished. Then several quay cranes will be assigned to the vessel.
The unloading tasks will be executed first. When an internal truck arrived, the quay crane will lift the container from the vessel, put it onto the 
truck. Then the truck will carry the container to target yard, and the quay crane will serve for the next truck. Similarly, when executing loading task,
the quay crane will lift the container from truck to vessel. Apart from loading and unloading containers, the quay crane also executes some assistant tasks, which
will be counted while calculating quay crane efficiency. There are some extra rules for quay cranes. First, the quay crane is ordered, and they can not be assigned
across the berth because the size of quay crane is too large to exchange location. Second, to balance the efficiency, the quay crane can be reassigned to the berth
next to the current working berth. CMICT has a 1.5 km quay line with and 18 quay cranes currently.

- **Yard Cranes and Stackers**. The yard cranes are used to lift and put containers. 
It is possible that one yard is assigned with multiple yard cranes, and one yard crane is shared by multiple yards.  
For efficiency purpose, the container will be reallocated within or between yards. The reallocation works within yard are executed by yard cranes by simply lifting
the container and putting to target location. If the container will be moved to another yard according to plan, an internal truck will be used to carry the container.
In CMICT, apart from standard yard crane, several stackers are also used similarly as yard cranes but only for empty containers. Besides, some of them are remotely controlled by the operators.

- **Internal Trucks**. The internal trucks are trucks that carry containers within the port. Their movements are strictly controlled by the port traffic rules, like the speed limitation.
When a task is assigned, the truck will first go to the lift position, wait the container to be putted on the trailer and move to the target position. When the truck
arrived at target position, it will also wait until the container is finally located at target position. In CMICT, some AGVs are also used as internal trucks.

- **External Trucks**. External trucks are trucks that imports and exports containers between port and other land logistic nodes. Despite some special case, an external truck 
carries a 40-inch standard container or two 20-inch standard containers. When an external truck come to the port, it will first check in at 
the gate, then go to target yard to unload or load containers. It is possible that one external truck involves both import and export tasks,
and involves multiple containers. When multiple tasks involved, the truck will not leave the port until all tasks finished. 


## Nottingham Terminal Surveillance Suite

The project is aiming to satisfy the needs of port production environment. The feature includes ensuring the monitoring of port devices, analysing the real-time operation of the port, 
illustrate the operational indicators of the port. On the other hand, the existence of barrier between different digital sub-system in the port prevents the integration of sub-system, 
therefore reduce the usability and weakens the effectiveness of operation analysis. The project is also required to integrate data from several sub-systems to bypass the data barrier,
to provide a holistic view for port operation and decision-making.

Based on the requirement, we design the system to be a Browser-Server architecture. A web browser based frontend is used to provide an aerial view of the port with real-time device position,
work status, and necessary configure operation. A backend server reads data from sub-system in CMICT, calculates necessary measure and prepare terminal snapshot for the browser and 
simulation. A stand-alone Anylogic simulation model is developed to make prediction of future terminal status. The input, output and execution of simulation model is controlled by backend
for automatic prediction.  

The rest of this section will discuss and analysis the detailed design of each module. 

### Backend

<!-- overview -->


<!-- Techinque stack -->

<!--  -->

### Frontend 

### Simulation



## Development Procedure

### Requirement Stage


### Design Stage


### Development Stage

#### Monitoring Development


#### Simulation Development


#### Refactor New Version

## Reflection