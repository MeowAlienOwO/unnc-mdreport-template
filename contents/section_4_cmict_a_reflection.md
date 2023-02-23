---
bibliography: ['../ref.bib']
---



CMICT Data Dashboard & Simulation Project: A Engineering Perspective Reflection
======

In the year 2022-2023, I participated the Ningbo Daxie China Merchants International Container Terminal(CMICT) Data Dashboard and Simulation project. This horizontal project 
is aiming to build a data mornitoring dashboard and simulation to assist the terminal operator to have one-step view on
the terminal devices with KPI, as well as predict future terminal status by simulation. This project is aiming to 
build a solid cooperation basis between the UNNC Digital Port Lab and CMICT. I am mainly responsible for the monitoring backend and data 
adaptor module development. In some certain situations, I also participated in other works including requirement engineering, UI design and 
project management. In this part, I will first briefly introduce the project background, and then talk about the developed system. Since the project last
for almost one year which is beyond the prediction, I will then describe the whole development process with reflection. Finally, I
will summarise the experience that our team gained and gives some general guidelines on how such business-oiented horizontal project should be operated
in future.


## Project Introduction



<!-- This section will briefly introduce the project. -->

### Ningbo Daxie China Merchants International Container Terminal(CMICT)
Ningbo Daxie China Merchants International Container Terminal(CMICT)[@cmictNINGBODAXIECHINA2023] is located at Beilun District, Ningbo city.
CMICT has 4 container ship berths with corresponding facilities, which can serve up to 2 million tons vessels.
The terminal is built and put into use with a yard and road area of 839,000 square metres. The design capacity of the terminal 
is 2.4 million TEU per year. Recent decade witnessed a rapid growth of cargo throughout. In 2008, the throughout was about 1 million TEU.
The number growed three times, reached to 3.16 million TEU in 2018.

The terminal is highly digitalised. Most of the devices in terminal in the port, including 16 bridge cranes, 51 gantry cranes, 13 stackers, 116 
in-terminal trucks, are tracked and managed by terminal operation system (TOS). In addition, several assitant systems are deployed to 
help managing the port, including computer vision based intelligence cargo system, non-contact social truck gate tracking system, etc.  
The terminal is now seeking for cooperators that could help build intelligent terminal to improve the whole efficiency.


### Data Monitoring Dashboard and Discrete Event Simulation

Data monitoring dashboard is a tool of visualising business data and key performance indicator(KPI) that gives manager a clear view of system.
[@freiManagementCockpitsConcept2016]
As a useful facility for support decision making, data dashboard provides a one-step view of critical statistics.  
A data dashboard has two major application: 1) help operators to build overview of system or business, therefore let the business growth or essential 
system fauts could be identified. 2) display pre-processed measure for decision maker or stakeholders to understand business.
Specifically, the port data monitoring dashboard is a IoT-oriented dashboard, which is mainly used to display the device information and related KPI.
CMICT requires the system to be able to reflect the real-time terminal status, including the device status and KPI analysis. 

<!-- In this project, the data monitoring dashboard is used to display the position of terminal devices, including D -->

Discrete Event Simulation(DES) is a method to model real word systems. DES regard the system operation as a sequence of events in time, where each event is happened in 
a certain timepoint. Decision makers can predict the future system status by deduction the state changes given system behaviour modelling. 
In this project, one of the major requirement of simulation is to identify traffic jam road by extrapolating the terminal status.


### Team

The team is leaded by the Digital Port Lab in principle. During the whole development procedure, the team is mainly self-managed. 
There are 4 major in the team, each is responsible for one certain part of project, all major member are PhD students in Digital Port Lab.
The major memebr includes:

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



## System Description




## Development Procedure

### Requirement Stage


### Design Stage


### Development Stage

#### Monitoring Development


#### Simulation Development


#### Refactor New Version

## Reflection

## Future Suggestions