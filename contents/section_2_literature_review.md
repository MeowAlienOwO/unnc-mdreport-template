---
bibliography: ['../ref.bib']
---

Literature Review
=====
This part will present the literature of the problem and recent research
progress in the academic community. We will first go through COP definition and
context in CO community, and then give an overview of machine learning and its
role in solving COP.

## Combinatorial Optimisation Problems (COP)

Combinatorial optimisation problem has been well-studied and have a rich
research context. In this section, we will focus on two problems that we
interested most: Bin Packing Problem and Vehicle Routing Problem. We would
briefly show the mathematical definition of the classic problem and its
variance. We will then review some classical algorithms including heuristics,
metaheuristics and hyperheuristics.

### Bin Packing Problem(BPP)
Bin packing problem (BPP) is one of the most studied problems in the
covering/packing problem family. The problem is described as follows: given a
sequence of items with different volumes, pack them into a finite number of
bins(or containers), such that the number of bins used is minimised.  The 1D BPP formulation
@martelloKnapsackProblemsAlgorithms1990 is described by equation \ref{eq:bpp_formulation}.

$$
    \begin{aligned}
        \label{eq:bpp_formulation}
        \min K &= \sum_{j=1}^N y_j\\
        s.t.& \\ 
        & \sum_{i\in I}^n s(i) x_{ij} \leq By_{j}~\forall j \in \{1..n\} & (1)\\
        & \sum_{j=1}^n x_{ij} = 1~\forall i \in I, \forall j \in \{1..n\} & (2)\\
        & y_j \in \{0, 1\}~\forall j \in \{1..n\} & (3)\\
        & x_{ij} \in \{0, 1\}~\forall j \in \{1..n\},\forall i \in I & (4) \\
        & K \geq 1 & (5)
    \end{aligned} 
$$ 

The total number of used bins is $K$. Item $i$ belongs to a finite set $I$,
size of item is determined by $s(i)$. $y_j$ represents the bin usage, $By_j$
determines the capacity of bin $y_j$. Decision variable $x_ij$ means the item
$i$ is allocated in bin $y_j$. Constraint (1) states the allocation of items
should not exceed the capacity of bins. Constraint (2) determines that each item
should only be allocated once. Constraints (3, 4) are integer constraints.
Constraint (5) ensures the bin usage is at least 1.

Several variances of bin packing problems were identified in practical problems.
The 2D/3D problems are highly linked to practical area such as wood or glass
industries, media typesetting, inventory management, cloud computing
[@lodiTwodimensionalPackingProblems2002,
@cid-garciaPositionsCoveringTwostage2020,
@fengMultiobjectiveMigrationAlgorithm2019]. These works usually consider rectangular items. 
Some industrial-driven problems
extended to irregular shape items and allow rotation during packing
[@bennellTutorialIrregularShape2009,
@hanConstructionHeuristicsTwodimensional2013,
@lopez-camachoUnifiedHyperheuristicFramework2014,
@martinez-sykoraMatheuristicsIrregularBin2017].
 In some situation, on-time reaction is required therefore the online version
of bin packing problem is identified. In such problems, item must be packed immediately
once accepted [@seidenOnlineBinPacking2002]. 

For 1D BPP, @johnsonNearoptimalBinPacking1973 had proposed several online heuristics including
Next Fit, First Fit, Best Fit. Harmonic is another class of online heuristics
that first classify the items and then pack the item according to some
hand-crafted rules. Offline heuristic solutions usually sort the item sequence
first, then do the packing with certain rules [@johnsonNearoptimalBinPacking1973,
@johnson7160TheoremBin1985, @hobergLogarithmicAdditiveIntegrality2017].
Metaheuristics and hyperheuristics are also applied in 1D BPP,
@perumalBinPackingProblems2016 reviewed several metaheuristics and
hyperheuristics paper, @yesodhaComparativeStudyHeuristic2012 did some
comparative research on metaheuristics and heuristics for 1D BPP. For exact
algorithms, @carvalhoLPModelsBin2002 reviewed and analysed several (integer)
linear programming formulation of 1D BPP and cutting stock problems since they
are related.

For higher order dimension problems, @coffmanIntroductionBinPacking2004 
extended 1D heuristics First-Fit Decreasing and Next-Fit Decreasing to offline
2D problems as FFD-Height and NFD-Height and analysed the worst case, later Best-Fit
Decreasing is also analysed. These methods consider height dimension of the 2D
item and justify item on left in strip packing problem.
@bakerOrthogonalPackingsTwo1980 purposed Bottom-Left algorithm by let the item
sorted by width, start packing at lowest possible position and left justified.
@chungPackingTwoDimensionalBins1982 introduced 2-phrace algorithm that obtain
a strip packing by Hybrid First-Fit and then consider the strip as item to solve
1D BPP. 2-phrace heuristics were further enriched and discussed by 
@frenkHybridNextfitAlgorithm1987 and @berkeyTwodimensionalFiniteBinpacking1987.
Metaheuristics is also applied widely in variance of BPP.
@dowslandExperimentsSimulatedAnnealing1993 represent simulated annealing for
bin packing problems. @jakobsGeneticAlgorithmsPacking1996,
@lodiTwodimensionalPackingProblems2002
[@lodiApproximationAlgorithmsOriented1999,
@lodiHeuristicMetaheuristicApproaches1999] introduced more metaheuristics methods
including Generic Algorithm and Tabu Search.

We refer keen readers to several surveys to establish an overview of bin packing
problems. @delormeBinPackingCutting2016 represents definition, approximation
and exact methods of 1D BPP. @lodiTwodimensionalPackingProblems2002 focused on
2D problems and @martelloThreeDimensionalBinPacking2000 reviewed 3D problems,
@christensenApproximationOnlineAlgorithms2017 focused on approximation methods
including heuristics and metaheuristics algorithms. For online problem,
@galambosOnlineBinPacking1995 reviewed several heuristic based approximation
methods. 

### Vehicle Routing Problem(VRP)

Vehicle routing problem is one of the most classical combinatorial optimisation
problems since first proposed by @dantzigTruckDispatchingProblem1959. VRP is
described as follows: there is a depot point and many customer points on the
map, customer points should be visited to satisfy their needs. A fleet of vehicles
starts and back to depot point, visit all customer nodes on their tours. Each
vehicle should only visit the depot point twice: at start and end point. The
objective function of VRP is the total cost of vehicle tours, like distance,
fuel, etc. 

The most common variant is Capitalized VRP(CVRP), where the capacity of the
vehicle is limited. We illustrate the mathematical formulation of CVRP by
equation~\ref{eq:vrp_formulation}. We use a graph $G=(V, E)$ represents the
roadmap of VRP problem. Vertices set $V$ includes all customer nodes and the
depot point, variable $i$, $j$ each represents a single vertex. Vertex $0$
represents the depot point, while other vertices represent customer points.
Decision variable $x_{ij}$ represents whether a tour passes the edge between
vertices $i$ and $j$. The cost of edge between vertices is $c_{ij}$. In total,
$K$ vehicles are available, $r(S)$ is the minimum number of vehicles needed to
serve the customer demand in set $S$. Constraints (1, 2) state that for each
customer point, there is exactly one entering edge and one exiting edge.
Constraints (3, 4) forces the number of exiting and entering vehicles to the
deposit point must be same as total number of vehicles, i.e. each vehicle should
start and back to depot point. Constraint (5) forces a vehicle could not serve
customers that beyond its capacity. The last constraint (6) is the integer
constraint for decision variable. Another important variation is adding time
window constraint to original VRP problem (VRPTW). The time window constraint
could either be strict such that the solution become infeasible once violate
(hard constraint) or receive a penalty (soft constraint).

<!-- LTeX: enabled=false -->

\begin{equation}
    \label{eq:vrp_formulation}
    \begin{aligned}
        \min &\sum_{i \in V}\sum_{j \in V} c_{ij} x_{ij}\\
        s.t.&~\\
        & \sum_{i \in V} x_{ij} = 1 ~\forall j \in V \backslash \{0\} &(1)\\
        & \sum_{j \in V} x_{ij} = 1 ~\forall i \in V \backslash \{0\} & (2)\\
        & \sum_{i \in V} x_{i0} = K & (3)\\
        & \sum_{i \in V} x_{0j} = K & (4)\\
        & \sum_{i \notin S}\sum_{j \in S} x_{ij} \geq r(S)~ \forall S \subseteq V \backslash \{0\}, S \neq \emptyset & (5)\\
        & x_{ij} \in \{0, 1\} ~ \forall i, j \in V & (6)
    \end{aligned}
\end{equation}

<!-- LTeX: enabled=true -->
The research of VRP is also highly application-driven.
@caceres-cruzRichVehicleRouting2014 listed a rich set of variances including
split-delivery VRP, heterogeneous fleet VRP, multiple depots VRP, etc. These
problems usually solve more real-world applications by considering more
constraints. @berhanStochasticVehicleRouting2014 reviewed several stochastic
VRP problems that some decision variable is stochastic like custom demand,
capacity of vehicle, or service time. @morVehicleRoutingProblems2020 considers
a class of VRP that the decision maker must consider the departure time of
depot. The development of transportation technology arose the interest of the
research community. @juanElectricVehiclesLogistics2016,
@montoyaElectricVehicleRouting and @erdelicSurveyElectricVehicle2019 survey
a set of VRP variance Electronic Vehicles(EV). A core concern of EV is the
technology of recharging, including battery switching vehicles, vehicles need to
be charged by charging station and different charging network.  
They also interested on how EV could help reduce pollution and carbon emission. 

The heuristics of VRP can be divided into two classes: the constructive
heuristics and improvement heuristics [@laporteChapterHeuristicsVehicle2014,
@cordeauGuideVehicleRouting2002]. The Clarke and Wright savings heuristics is
one of the most classical constructive heuristics
[@clarkeSchedulingVehiclesCentral1964]. This method initializes the solution by
construct back and forth routes, then iteratively merge the routes that could
save most distance. @linComputerSolutionsTraveling1965 purposed a classical
improvement method to solve TSP by iteratively remove and replace $\lambda$
edges in the solution that could improve the solution most, until no further
improvement could be found. @linEffectiveHeuristicAlgorithm1973 improved this
method later to allow dynamic $\lambda$.

Metaheuristics of VRP can be roughly classified as local search methods and
population-based. Local search methods starts from an initial solution and
iteratively change the solution to its neighbourhood. Unlike the greedy
improvement heuristics, local search allows new solution to be less optimal to
let the algorithm able to jump out of local minima. Local search algorithms can
be implemented by Simulated Annealing
[@osmanMetastrategySimulatedAnnealing1993, @groerLibraryLocalSearch2010,
@liVeryLargescaleVehicle2005], Tabu
Search[@gendreauTabuSearchHeuristic1994], Variable Neighbourhood Search
[@kytojokiEfficientVariableNeighborhood2007]. Population-based methods
maintains a set of solution representation with high-level guidance. In
low-level, population-based methods rely on some local search methods to obtain
solution candidates. Several works implemented Genetic
Algorithms[@nagataEdgeAssemblybasedMemetic2009,
@prinsSimpleEffectiveEvolutionary2004, @vidalHybridGeneticAlgorithm2012].
@reimannDAntsSavingsBased2004 implemented ant colony algorithm with
Clarke-Wright low-level heuristics.

### Typical solution methods

There are mainly two branches of solution methods for COP: exact methods and
approximation methods. The exact algorithm is aiming to find the theoretical
optimal solution. Consider the NP-Hardness of COP, finding an optimal solution,
especially large-scale COP, might become too complex to solve. Therefore, the
complexity (time, space) is the major concern of exact algorithms. On the other hand,
in most case, instead of finding strict optimal, the decision maker are more willing to 
get a good enough solution with relatively limited computation power. In this case, both the 
solution quality and algorithm complexity are key criteria of the algorithm.

#### Exact algorithms

We discuss two classical exact algorithms: branch-and-bound and dynamic
programming to represent the overview of exact algorithms. Both algorithms
behave divide-and-conquer manner to divide the problem into sub-problems, and
combine them together to form final solution. Branch-and-Bound methods
[@lawlerBranchandBoundMethodsSurvey1966] divide the whole search space into
several sub-spaces recursively, and output the best feasible solution among all sub-spaces.
Dynamic programming [@bellmanDynamicProgramming1966] focusing on solving the
problems that could share subproblems. In that case, instead of solving each
sub-problem, the output of shared sub-problems will be maintained and reused. The solution
is constructed by recursively solve and reuse sub-problems.

<!-- pseudocode & formula of two algorithms -->
Although the optimal solution is guaranteed by exact algorithms, it could happen
that finding the solution requires unacceptable time or space. We take the
branch-and-bound as an example to show how method could be applied to improve
the solution speed of the algorithm. Consider the branch-and-bound procedure can be viewed as  
traversing a searching tree whose node is a subspace of the whole search
space, people consider two major strategy: improve the search strategy
[@ignallApplicationBranchBound1965,
@lomnickiBranchandBoundAlgorithmExact1965] and pruning non-optimal
branch[@landAutomaticMethodSolving1960, @ignallApplicationBranchBound1965,
@rios-mercadoBranchandboundAlgorithmPermutation1999].

#### Approximation algorithms

The approximation algorithms can be considered as two parts: rule-based
heuristics and metaheuristics. Rule-based methods are highly relied on the expert
knowledge of the target domain. These algorithms are more human-understandable,
and usually can achieve polynomial time complexity. Theoretically, the
lower bound of rule-based methods can be strictly proved. However, the solution
quality of these algorithms usually have larger gap towards optimal comparing
with metaheuristics solutions. These methods are also easily be trapped to some
local optima. 

Metaheuristics algorithms [@gloverFuturePathsInteger1986] combines the
rule-based heuristics with higher level framework which aiming to explore the
whole search space more efficiently. Comparing with problem-specific rule-based
algorithms, metaheuristics can be seen as general framework and can adapt to
different problems by making minimal modification
[@blumMetaheuristicsCombinatorialOptimization2003]. This makes metaheuristics
naturally suitable to deal with the situation that the problem parameters are
uncertain. Further, the domain-specific knowledge and handcraft design effort
are reduced. However, although experimentally successful in many problems,
metaheuristics usually can not analyse the lower bound or gap to optimal
theoretically. Although usually can find better solution than rule-based
methods, metaheuristics is also easily to come up with local optima rather than
global optimal solution.



## Machine Learning and connection to COP

Machine learning is the research area that focusing on improve the performance
of a system by experience or data [@mitchellMachineLearning1997]. It is a wide
and active research area, and also highly connected to optimisation topics.
Optimisation methods are applied to help the learning system to adjust model
parameter given data. In this section, we briefly separate the research field
into supervised learning, unsupervised learning and reinforcement learning. We
will focus on the reinforcement learning part not only is because it is the
major topic of this report, but also because it connects the combinatorial
optimisation field more tightly than the other two methods.

### Supervised Learning

In supervised learning, the system learns a map from input to output by example
input-output data [@russellArtificialIntelligenceModern2010]. The aiming of
the learning process is defined as minimizing the gap between the model output and example
output label, i.e. the error. The measure that evaluate the gap between of model output and
example output is defined as loss function, which is varied according to problem
property. Generalization is one of the major concern of supervised learning
since people want the model have good performance not only on given examples,
but also on unknown future data. 

Supervised learning can be applied in several aspects in COP algorithms. One
possible approach is to improve existing exact/approximate algorithm.
@baltean-lugojanSelectingCuttingPlanes consider exact solution of non-convex
quadratic programming problem. In this problem, supervised learning is applied
to replace the computation-expencive sub-matrix selection procedure. Several
works were done to improve the performance of branch-and-bound methods to help
improve the efficiency of branching [@alvarezMachineLearningBasedApproximation2017,
@alvarezSupervisedMachineLearning2014,
@khalilLearningBranchMixed2016, @gasseExactCombinatorialOptimization2019].

Another approach is to learn a model to predict the solution, which can be
viewed as end-to-end approach. A typical work is done by
@vinyalsPointerNetworks2017 learns a model to generate VRP solution given
problem instance. @larsenPredictingTacticalSolutions2021 use neural
network to predict the solution of stochastic loan programming model.

Finally, we pointed out that supervised learning are frequently to help
configure the problem. @kruberLearningWhenUse2017 and
@bonamiLearningClassificationMixedInteger2018 applies learning to predict the
structure of problem (whether to decompose or linearize) to improve the
solution speed. A more straight-forward approach is to use supervise learning to
learn the piece of information that helps build the model.
@markoviUSINGDATAMINING2005 builds the stochastic customers' demand model by
training neural networks. @fuceSolvingStrategyRealworld2010 learns to classify
the customer's commands. For real world problems,
@zhangDataDrivenIntelligentTransportation2011 reviewed several data-driven
traffic management systems where computer vision are applied to learn the
environment.

### Unsupervised Learning
Unlike supervised learning, unsupervised learning does not have input-output
pair. Unsupervised learning is aiming to capture the feature of the example. A
common approach is trying to fit the joint distribution of given data. According
to @bengioMachineLearningCombinatorial2021, there are very limited work trying
to combine unsupervised learning with COP. An example by
@erdoganGreenVehicleRouting2012 made some attempt of combine unsupervised
learning to help solve green-VRP problem.

### Reinforcement Learning
<!-- TODO reference -->
Reinforcement learning is a framework that solve the sequential decision
problems [@suttonReinforcementLearningIntroduction1998]. Reinforcement learning trains an
agent that could interact with a dynamic environment, which could get the status
of environment (state), execute action, and gain feedback(reward) from the
environment. The agent learns a policy to maximise accumulated reward signal by
trial-and-error search through interaction with the environment
[@suttonReinforcementLearningIntroduction1998, @nianReviewReinforcementLearning2020]. In operation research
context, reinforcement learning is also referred to approximate dynamic
programming [@bertsimasDatadrivenRobustOptimization2018] or neuro-dynamic programming
[@bertsekasApproximateDynamicProgramming2008]. 

Reinforcement learning (RL) is formalised as the optimal control problem of
Markov decision processes (MDP) [@howardDynamicProgrammingMarkov1960]. An MDP is defined by
4-tuple $(S, A, P_a, R_a)$ where $S$ represents the state space, $A$ represents
action space, $P_a(s, s') == \Pr(s_{t+1} = s'|s_t = s, a_t = a)$ is the
transition function between two states given action and current state, $R_a(s,
s')$ is a numerical reward signal for action $a$ when state transfers from $s$
to $s'$. The optimisation objective is to maximise the except of accumulated
reward $E[\sum_{t=0}^\infty \gamma^t R_{a_t}(s_t, s_{t+1})]$. Under the
Reinforcement learning literature, $P_a$ and $R_a$ are represented by the
environment $E$. The agent is aiming to learn the policy $\pi: A \times S
\leftarrow [0, 1], \pi(a, s) = \Pr (a_t = a|s_t = s)$ which could achieve the
optimisation objective. For each state $s_t$, the agent pickup an action $a_t$
for current state $s_t$, then state of the environment will change to $s_{t+1}$
accordingly, and the agent will receive reward signal $r_{t+1}$.

Deep learning (DL), on the other hand, is a wide set of machine learning methods
that based on artificial neural networks (ANN, or in short NN). The most
significant difference between DL and other "shallow" machine learning methods
is the application of deep and complex neural network structures, by which
enables the network to extract higher dimension feature. On contrast, "shallow"
machine learning methods usually use relatively simple models
[@liDeepReinforcementLearning2018]. 

@schmidhuberDeepLearningNeural2014 briefly described several combinations of RL and DL
with relative papers. Deep learning could be used in modelling environment,
preprocessing RL input [@jodogneClosedLoopLearningVisual2007], modelling the value
function of each state, or generate policy [@suttonReinforcementLearningIntroduction1998].
Important algorithms in DRL include deep Q networks [@mnihAsynchronousMethodsDeep2016],
policy gradients based methods [@suttonReinforcementLearningIntroduction1998,
@schulmanProximalPolicyOptimization2017], Monte Carlo Tree Search
[@silverMasteringGameGo2016, @silverMasteringChessShogi2017],
Actor-Critic[@kondaActorCriticAlgorithms, @mnihAsynchronousMethodsDeep2016]. 

#### RL for VRP

It is natural that finding a solution for a VRP instance by eventually combine
nodes to construct the whole tour. In such approach, researchers model the
following elements with MDP formulation: the whole graph and current constructed
partial solution as state, available vertex that to be added to the current
solution as action. A new state switches by adding a new vertex to current
solution. Reward function usually determined according to the nature of problem,
e.g. the total cost. @vinyalsPointerNetworks2017 purposed Pointer Network, a
network structure that combined encoder-decoder structure with attention
mechanism[@vaswaniAttentionAllYou2017] to select nodes. The structure is able
to solve the routing problem by masking out illegal solutions. They use pointer
network to solve Travelling Salesman Problem(TSP) by supervised learning given
problem instances and sample solutions. Later @belloNeuralCombinatorialOptimization2017 trained
pointer network by REINFORCE[@suttonReinforcementLearningIntroduction1998] algorithm.
@daiLearningCombinatorialOptimization2018 purpose structure2vec to encode graph-structured
information, including nodes in routing problem. They solved TSP by fitting
graph network with Q-learning. Similarly, @maCombinatorialOptimizationGraph2019 purse
using graph embedding as input layer for pointer network in order to solve
routing problems. @koolAttentionLearnSolve2019 proposed a transformer-based model
to solve routing problems, such as TSP, CVRP, or split delivery VRP.
@pengDeepReinforcementLearning2020 generalised the previous method this approach to use a
dynamic attention model, so that state features can be updated during the
construction of a solution. 

Perturbation methods are purposed later, in which the RL agent improve the
solution from a feasible but not optimal stage with several low-level
heuristics. @chenLearningPerformLocal2019 trains a rule picker and a region picker
separately, start from a feasible solution and then improve using trained rule
and region picker to modify the solution. A similar method called Learn to
Improve was purposed by @luLearningbasedIterativeMethod2019, which also generate
optimal solution by continuous improve a feasible solution. Such method
outperforms LKH3 heuristics [@helsgaunExtensionLinKernighanHelsgaunTSP], which is the
state-of-art solution of VRP.

#### RL for BPP

We separate the RL solution for BPP by dimension: 1D BPP and higher dimension
BPP. Not only because of the research area size, but also the focus of problems:
in 1D BPP, we usually interested in allocating items across several containers.
In higher order problems, the primary research interest in existing DRL works is
how to allocate items into one properly.


The research on DRL for BPP covers many RL for 1D BPP can also be divided into
two major mainstream approaches. One is to combine RL with
heuristics/metaheuristics in a two-stage manner, the other is using RL only to
model the policy of bin selection. Splitting the problem into two stages, that
is, use a high-level hyper-heuristics model (where may use RL method) to pick a
region or choose a heuristic, then generate a solution using low-level
heuristics. This approach maintains the flexibility of heuristics while reducing
search space. @haffariAnalysisSTAGEAlgorithm applied a TD-$\lambda$ based
algorithm STAGE to learn the evaluation function to evaluate the quality of the
initial state of local search and tested on bin packing problems. Similarly,
@caiReinforcementLearningDriven2019 uses reinforcement learning to generate an initial
solution for further heuristics' optimisation. They also use the signal generated
by heuristics to optimise the training of RL model.
@silva-galvezDiscoveringActionRegions2020 split bin packing problems into action
regions, and select suitable heuristics by a hyper-heuristic framework. Recent
researches also showed with the development of RL, a single RL solution for BPP
is possible. @balajiORLReinforcementLearning2019 purpose use Proximal Policy
optimisation(PPO) to solve online stochastic optimisation problems, including
BPP, VRP and news vendor problem. 


The methods on higher dimension BPP are mixed according to what kind of problem
the researchers interested in. @kunduDeepPackVisionBased2D2019 applied Convolutional
Neural Networks(CNN) [@lecunGradientbasedLearningApplied1998] to solve online 2D BPP.
@vermaGeneralizedReinforcementLearning2020 apply DQN to solve 3D BPP with only a single container.
They define movements for rectangle items and train DQN to select movements.
@huSolvingNew3D2017 apply policy-based network to produce item packing sequence
given original item sequence for 3D bin packing problems. The items will then
be packed using traditional heuristics. @zhaoOnline3DBin2021 use CNN to encode
empty space for 3D BPP and then use constrained programming to find loading
position. For multiple bins, they use Monte Carlo permutation tree to adjust
the sequence of item input and then place items with previous mentioned
methods. @laterreRankedRewardEnabling2018 purposed a self-competitive mechanism to train an
agent to beat the record generated by itself to solve 2D and 3D BPP. For
practical problems, @wangSelfplayLearningStrategies2021 used DRL to improve the resource
assignment in Open-RAN networks. 



## Automated Guided Vehicle(AGV) And Related Problems
Automated Guided Vehicles (AGV) are a class of mobile vehicles that guided by 
physical guidance like magnetic tape or induction lines, radar or computer visual.
AGV is now heavily applied in modern industry and logistics field. 
Researchers and industrial engineers focus on several practical problems, including:
1) avoid accidents such as traffic jams and collisions, 2) optimise critical metrics such as travel time and 
fuel cost.

### AGV Dispatching

The dispatching problem is concerned with the process of selecting and assigning tasks to vehicles [@coReviewResearchAGVS1991, @langevinDispatchingRoutingScheduling1996].
Although application scenarios vary, in general, the dispatching problem considers optimising critical metrics while satisfying hard or soft constraints.
Possible metrics including: minimising load waiting time, maximising system throughput, minimising queue length, or guaranteeing the processing power of critical nodes. 
In the early days of related research, researchers proposed rule-based algorithms. @kimDevelopingDispatchingRule1995 uses several functions to balance transport 
distance with work weights and target node state information. Rule-based heuristics are usually response in short time and can give feasible solutions in a 
short time, but their resulting policies tend to have a large optimisation space. Dispatch models developed based on metaheuristic [@bianchiSurveyMetaheuristicsStochastic2009] algorithms 
have also been applied to solve AGV dispatch problems[@udhayakumarTaskSchedulingAGV2010, @nasoMulticriteriaMetaHeuristicsAGV2005, @linNetworkModelEffective2006]. 
Such methods usually lead to better solutions, but their optimality is not 
theoretically guaranteed. A range of mathematical planning-based algorithms, such as integer programming and mixed integer programming, 
have been applied where a higher degree of optimality is required [@kasilingamMathematicalModelingAGVS1991]. These methods usually give optimal or near-optimal solutions for a given scenario, 
but their modelling requires significant domain knowledge and expertise, and due to the NP-hard nature of the problem, the amount of computation required 
increases dramatically when faced with many AGV or environmental variables. In recent years, with the development of machine learning and 
reinforcement learning techniques, AGV dispatching algorithms have been combined with these techniques, such as @changAGVDispatchingAlgorithm2022 using deep Q-networks to overcome 
the difficulties of mathematical modelling in complex production scenarios, and @liArtificialIntelligenceEmpowered2019 using machine learning methods to extrapolate the future tasks of the system in order to pre-dispatch AGV.


### AGV Routing

The AGV way finding problem is concerned with the decision to select the particular path that each vehicle needs to perform, 
enabling it to complete its transport task. In particular, under certain conditions, researchers also consider the arrival and 
departure times of vehicles along the route to prevent conflicts and even collisions of resources along the route [@coReviewResearchAGVS1991, @langevinDispatchingRoutingScheduling1996], a sub-problem 
also known as the Scheduling of AGV. Due to the similarity of the problems, AGV routing is often reduced to a Vehicle Routing Problem 
(VRP). Considering the timeliness of the decision, the routing algorithm can be divided into static routing and dynamic routing. Static 
routing does not change routes during algorithm execution, while dynamic routing will switch routes depending on the scenario. Dynamic 
routing often requires more powerful computational resources and suboptimal algorithms to achieve real-time computation, while static 
routing has more abundant computational resources. On the other hand, static pathfinding is difficult to cope with unexpected scenarios, 
especially if the AGV comes with functions such as obstacle avoidance, and is prone to problems such as deadlock. The classical AGV pathfinding 
algorithm models the pathfinding task as a VRP problem with a time window, and the deadlock prevention of AGV is achieved by limiting the node 
occupation through the time window. The aforementioned heuristics, meta-heuristics, mathematical modelling algorithms and other methods have more 
mature research results for VRP problems with time windows [@fisherVehicleRoutingTime1997, @solomonAlgorithmsVehicleRouting1987, @kolenVehicleRoutingTime1987, @ullrichIntegratedMachineScheduling2013]. 
Considering the conflict scenario of AGV, @mohringConflictfreeRealtimeAGV2005, @krishnamurthyDevelopingConflictFreeRoutes1993, and @huangLabelingAlgorithmNavigation1993 proposed a series of 
heuristic pathfinding algorithms based on Dijkstra's shortest circuit. The study of the scheduling problem of AGV is relatively independent, 
@hartmannGeneralFrameworkScheduling2005 proposed a framework for optimising terminal scheduling, @xiaobingApplicationAnalyticProcess1998 used resource analysis method to analyse the AGV scheduling problem.
