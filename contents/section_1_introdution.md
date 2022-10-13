---
bibliography: ['../ref.bib']
---

Introduction
=====

Combinatorial optimisation problems (COP) is a sub-field of mathematical
optimisation problems that finds an optimal object given a finite collection of
objects [@schrijverCombinatorialOptimizationPolyhedra2003a]. Since COP is
highly associated in real-world decision problems such as logisitics management
and manufacturing industry, solving COP could help decision maker to improve the
decision quality. Most COPs are considered as NP-Hard, which involve large
search space in academic benchmarks and real-world problems
[@michalewiczEvolutionaryAlgorithms2003]. People have developed several
classical methods to solve COP, including heuristics, solving integer/mixed
integer programming model and metaheursitics. 

Unlike the problems people studied when CO and COP was proposed, researchers are
now more interested on complex problems, especially those has close connection
with real-world application scenarios. These problems usually are large-scale,
complex and uncertain. If formalised real-world problems as COP, the scale of
them are usually large in both number of constraints and decision variables.
Besides, the data that modern industry generates could also be huge. In
real-world problems, the human factor and complex decision environment basis let
the problem becomes highly uncertain. Therefore, decision maker might hard, if
not impossible, to formulate the real-world with high quality mathematical
model. Finally, the verification cost of real-world could be very expensive
under production environment, which lead the algorithm development and
verification become hard. 

Based on knowledge of operation research, our lab introduce machine learning and
simulation together to face more real-world challendges. In this work, we will
mainly discuss about machine learning, especially how Deep Reinforcement
Learning (DRL) could take part in COP. Machine learning as part of artificial
intelligence, is defined as a procedure to improve the performance of a system
through historical data [@mitchellMachineLearning1997]. Specifically,
reinforcement learning as sub-field of machine learning, define the learning
process as optimize the decision quality by interaction with environment
[@silverMasteringGameGo2016]. A well-known example by @silverMasteringGameGo2016 showed that DRL is able to
outperforms human top-level players in Go, which is proven to be
PSPACE-hard. @bengioMachineLearningCombinatorial2020
discussed about how machine learning helps solving COP, @baiAnalyticsMachineLearning2022
later reviewed in detail how machine learning can be used in Vehicle Routing
Problems. Overall, machine learning can: 1) learn expert knowledge of solving
combinatorial problems, which could help reduce computation load in practical
problems, and 2) find a better solution by switch the original problem into
learning tasks [@bengioMachineLearningCombinatorial2020]. 

The main motivation of this PhD project is to contribute to the academic
community on the combination of learning methods, especially deep reinforcement
learning and combinatorial optimisation. To be more specific, with the
cooperation of UNNC's academic partners, including Ningbo Port and MSRA, this
project will be more focused in solving combinatorial problems that highly
related to port logistics and transportation, such as vehicle routing problems
and bin packing problems. 