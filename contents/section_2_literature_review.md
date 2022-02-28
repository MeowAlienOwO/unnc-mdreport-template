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

Combinationrial optimisation problem has been well-studied and have a rich
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
@martello_knapsackproblemsalgorithms_1990 is described by equation \ref{eq:bpp_formulation}.

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
[@lodi_twodimensionalpackingproblems_2002,
@cid-garcia_positionscoveringtwostage_2020,
@feng_multiobjectivemigrationalgorithm_2019]. These works usually consider rectangular items. 
Some industrial-driven problems
extended to irregular shape items and allow rotation during packing
[@bennell_tutorialirregularshape_2009,
@han_constructionheuristicstwodimensional_2013,
@lopez-camacho_unifiedhyperheuristicframework_2014,
@martinez-sykora_matheuristicsirregularbin_2017
]. In some situation, on-time reaction is required therefore the online version
of bin packing problem is identified. In such problems, item must be packed immediately
once accepted [@seiden_onlinebinpacking_2002]. 

For 1D BPP, @johnson1973near had proposed several online heuristics including
Next Fit, First Fit, Best Fit. Harmonic is another class of online heuristics
that first classify the items and then pack the item according to some
hand-crafted rules. Offline heuristic solutions usually sort the item sequence
first, then do the packing with certain rules [@johnson1973near,
@johnson_7160theorembin_1985, @hoberg_logarithmicadditiveintegrality_2017].
Metaheuristics and hyperheuristics are also applied in 1D BPP,
@perumal_binpackingproblems_2016 reviewed several metaheuristics and
hyperheuristics paper, @yesodha_comparativestudyheuristic_2012 did some
comparative research on metaheuristics and heuristics for 1D BPP. For exact
algorithms, @carvalho_lpmodelsbin_2002 reviewed and analysed several (integer)
linear programming formulation of 1D BPP and cutting stock problems since they
are related.

For higher order dimension problems, @coffman_introductionbinpacking_2004
extended 1D heuristics First-Fit Decreasing and Next-Fit Decreasing to offline
2D problems as FFD-Height and NFD-Height and analysed worst case, later Best-Fit
Decreasing is also analysed. These methods consider height dimention of the 2D
item and justify item on left in strip packing probem.
@baker_orthogonalpackingstwo_1980 purposed Bottom-Left algorithm by let the item
sorted by width, start packing at lowest possible position and left justified.
@chung_packingtwodimensionalbins_1982 introduced 2-phrace algorithm that optain
a strip packing by Hybrid First-Fit and then consider the strip as item to solve
1D BPP. 2-phrace heuristics were further enriched and discussed by 
@frenk_hybridnextfitalgorithm_1987 and @berkey_twodimensionalfinitebinpacking_1987.
Metaheuristics is also applied widely in variance of BPP.
@dowsland_experimentssimulatedannealing_1993 represent simulated annealing for
bin packing problems. @jakobs_geneticalgorithmspacking_1996,
@lodi_twodimensionalpackingproblems_2002
[@lodi_approximationalgorithmsoriented_1999,
@lodi_heuristicmetaheuristicapproaches_1999] introduced more metaheuristics methods
including generic algorithm and tabu search.

We refer keen readers to several serveys to establish an overview of bin packing
problems. @delorme_binpackingcutting_2016 represents definition, approximation
and exact methods of 1D BPP. @lodi_twodimensionalpackingproblems_2002 focused on
2D problems and @martello_threedimensionalbinpacking_2000 reviewed 3D problems,
@christensen_approximationonlinealgorithms_2017 focused on approximation methods
including heuristics and metaheuristics algorithms. For online problem,
@galambos_onlinebinpacking_1995 reviewed several heuristic based approximation
methods. 

### Vehicle Routing Problem(VRP)

Vehicle routing problem is one of the most classical combinatorial optimisation
problems since first proposed by @dantzigTruckDispatchingProblem1959. VRP is
described as follows: there is a depot point and many customer points on the
map, customer points should be visit to satisfy their needs. A fleet of vehicles
start and back to depot point, visit all customer nodes on their tours. Each
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

The research of VRP is also highly application-driven.
@caceres-cruz_richvehiclerouting_2014 listed a rich set of variances including
split-delivery VRP, heterogenerous fleet VRP, multiple depots VRP, etc. These
problems usually solve more real-world applications by considering more
constraints. @berhan_stochasticvehiclerouting_2014 reviewed several stochastic
VRP problems that some of decision variable is stochastic like custom demand,
capacity of vehicle, or service time. @mor_vehicleroutingproblems_2020 consider
a class of VRP that the decision maker must consider the departure time of
depot. The development of transportation technology arose the interest of the
research community. @juan_electricvehicleslogistics_2016,
@montoya_electricvehiclerouting_ and @erdelic_surveyelectricvehicle_2019 survey
a set of VRP variance Electrinic Vehicles(EV). A core concern of EV is the
technology of recharging, including battery switching vehicles, vehicles need to
be charged by charging station and different charging network.  
They also interested on how EV could help reduce pollution and carbon emission. 

The heuristics of VRP can be divided into two classes: the constructive
heuristics and improvement heuristics [@laporte_chapterheuristicsvehicle_2014,
@cordeau_guidevehiclerouting_2002]. The Clarke and Wright savings heuristics is
one of the most classical constructive heuristics
[@clarkeSchedulingVehiclesCentral1964]. This method initializes the solution by
construct back and forth routes, then iteratively merge the routes that could
save most distance. @lin_computersolutionstraveling_1965 purposed a classical
improvement method to solve TSP by iteratively remove and replace $\lambda$
edges in the solution that could improve the solution most, until no futher
improvement could be found. @lin_effectiveheuristicalgorithm_1973 improved this
method later to allow dynamic $\lambda$.

Metaheuristcs of VRP can be roughtly classified as local search methods and
population-based. Local search methods starts from a initial solution and
iteratively change the solution to its neighborhood. Unlike the greedy
improvment heuristics, local search allows new solution to be less optimal to
let the algorithm able to jump out of local minima. Local search algorithms can
be implemented by Simulated Annealing
[@osman_metastrategysimulatedannealing_1993, @groer_librarylocalsearch_2010,
@li_verylargescalevehicle_2005], Tabu
Search[@gendreau_tabusearchheuristic_1994], Variable Neighborhood Search
[@kytojoki_efficientvariableneighborhood_2007]. Population-based methods
maintains a set of solution representation with high-level guidance. In
low-level, population-based methods rely on some local search methods to obtain
solution candidates. Several works implemented Genetic
Algorithms[@nagata_edgeassemblybasedmemetic_2009,
@prins_simpleeffectiveevolutionary_2004, @vidal_hybridgeneticalgorithm_2012].
@reimann_dantssavingsbased_2004 implemented ant colony algorithm with
Clarke-Wright low-level heuristics.

### Typical solution methods

There are mainly two branch of solution methods for COP: exact methods and
approximation methods. The exact algorithms is aiming to find the theoretical
optimal solution. Consider the NP-Hardness of COP, finding a optimal solution,
especially large-scale COP, might become too complex to solve. Therefore, the
complexity (time, space) is the major consern of exact algorithms. On the other hand,
in most case, instead of finding strict optimal, the decision maker are more willing to 
get a good enough solution with relatively limited computation power.In this case, both the 
solution quality and algorithm complexity are key critieria of the algorithm.

#### Exact algorithms

We discuss two classical exact algorithms: branch-and-bound and dynamic
programming to represent the overview of exact algorithms. Both algorithms
behave divide-and-conquer manner to divide the problem into sub-problems, and
combine them together to form final solution. Branch-and-Bound methods
[@lawler_branchandboundmethodssurvey_1966] divide the whole search space into
several sub-spaces recursively, and output the best feasible solution among all sub-spaces.
Dynamic programming [@bellman_dynamicprogramming_1966] focusing on solving the
problems that could share subproblems. In that case, instead of solving each
subproblem, the output of shared subproblems will be maintained and reused. The solution
is constructed by recursively solve and reuse subproblems.

<!-- pseudocode & formula of two algorithms -->
Although the optimal solution is guaranteed by exact algorithms, it could happen
that finding the solution requires unacceptable time or space. We take the
brannch-and-bound as an example to show how method could be applied to improve
the solution speed of the algorithm. Consider the branch-and-bound procedure can be viewed as  
as traversing a searching tree whose node is a sub-space of the whole search
space, people consider two major strategy: improve the search strategy
[@ignall_applicationbranchbound_1965,
@lomnicki_branchandboundalgorithmexact_1965] and pruning non-optimal
branch[@land_automaticmethodsolving_1960, @ignall_applicationbranchbound_1965,
@rios-mercado_branchandboundalgorithmpermutation_1999].

#### Approximation algorithms

The approximation algorithms can be considered as two parts: rule-based
heuristics and metaheuristics. Rule-based methods are highly rely on the expert
knowledge of the target domain. These algorithms are more human-understandable,
and usually can achieve polynomial time complexity. Theoretically, the
lowerbound of rule-based methods can be strictly proved. However, the solution
quality of these algorithms usually have larger gap towards optimal comparing
with metaheuristics solutions. These methods are also easily be trapped to some
local optima. 

Metaheuristic algorithms [@glover_futurepathsinteger_1986] combines the
rule-based heuristics with higher level framework which aiming to explore the
whole search space more efficiently. Comparing with problem-specific rule-based
algorithms, metaheuristics can be seen as general framework and can adapt to
different problems by making minimal modification
[@blum_metaheuristicscombinatorialoptimization_2003]. This makes metaheuristics
natually suitable to deal with the situation that the problem parameters are
uncertain. Further, the domain-specific knowledge and handcraft design effort
are reduced. However, although experimentally successful in many problems,
metaheuristics usually can not analyze the lowerbound or gap to optimal
theoretically. Although usually can find better solution than rule-based
methods, metaheuristics is also easily to come up with local optima rather than
global optimal solution.



## Machine Learning and connection to COP

Machine learning is the research area that focusing on improve the performance
of a system by experience or data [@mitchell_machinelearning_1997]. It is a wide
and active research area, and also highly connected to optimization topics.
Optimization methods are applied to help the learning system to adjust model
parameter given data. In this section, we briefly separate the research field
into supervised learning, unsupervised learning and reinforcement learning. We
will focus on the reinforcement learning part not only is because it is the
major topic of this report, but also because it connect the combinatorial
optimization field more tightly than the other two methods.

### Supervised Learning

In supervised learning, the system learns a map from input to output by example
input-output data [@russell_artificialintelligencemodern_2010]. The aiming of
the learning process is defined as mininmizing the gap between the model output and example
output label, i.e. the error. The measure that evaluate the gap between of model output and
example output is defined as loss function, which is vary according to problem
property. Generalization is one of the major concern of supervised learning
since people want the model have good performance not only on given examples,
but also on unknown future data. 

Supervised learning can be applied in several aspects in COP algorithms. One
possble approach is to improve existing exact/approximate algorithm.
@baltean-lugojan_selectingcuttingplanes_ consider exact solution of non-convex
quadratic programming problem. In this problem, supervised learning is applied
to replace the computation-expencive sub-matrix selection procedure. Several
works was done to improve the performance of branch-and-bound methods to help
improve the efficiency of branching [@alvarez_supervisedmachinelearning_2014,
@alvarez_machinelearningbasedapproximation_2017,
@khalil_learningbranchmixed_2016, @gasse_exactcombinatorialoptimization_2019].

Another approach is to learn a model to predict the solution, which can be
viewed as end-to-end approach. A typical work is done by
@vinyalsPointerNetworks2017 learns a model to generate VRP solution given
problem instance. @larsen_predictingtacticalsolutions_2021 use neural
network to predict the solution of stochastic loan programming model.

Finally, we pointed out that supervised learning are frequently to help
configuring the problem. @kruber_learningwhenuse_2017 and
@bonami_learningclassificationmixedinteger_2018 applies learning to predict the
structure of problem (whether to decompose or linearlize) to improve the
solution speed. A more straight-forward approach is to use supervise learning to
learn the piece of information that helps build the model.
@markovi_usingdatamining_2005 build the stochastic customers' demand model by
training neural networks. @fuce_solvingstrategyrealworld_2010 learns to classify
the customer's commands. For real world problems,
@zhang_datadrivenintelligenttransportation_2011 reviewed several data-driven
traffic management systems where computer vison are applied to learn the
environment.

### Unsupervised Learning
Unlike supervised learning, unsupervised learning does not have input-output
pair. Unsupervised learning is aiming to capture the feature of the example. A
common approach is trying to fit the joint distribution of given data. According
to @bengio_machinelearningcombinatorial_2021, there are very limited work trying
to combine unsupervised learning with COP. An example by
@erdogan_greenvehiclerouting_2012 made some attempt of combine unsupervised
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
programming [@bertsekas2008approximate] or neuro-dynamic programming
[@bertsekas1995neuro]. 

Reinforcement learning (RL) is formalised as the optimal control problem of
Markov decision processes (MDP) [@howard1960dynamic]. A MDP is defined by
4-tuple $(S, A, P_a, R_a)$ where $S$ represents the state space, $A$ represents
action space, $P_a(s, s') == \Pr(s_{t+1} = s'|s_t = s, a_t = a)$ is the
transition function between two states given action and current state, $R_a(s,
s')$ is a numerical reward signal for action $a$ when state transfers from $s$
to $s'$. The optimisation objective is to maximize the except of accumulated
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

@schmidhuberDeepLearningNeural2014 briefly described several combination of RL and DL
with relative papers. Deep learning could be used in modelling environment,
preprocessing RL input [@jodogneClosedLoopLearningVisual2007], modelling the value
function of each state,  or generate policy [@suttonReinforcementLearningIntroduction1998].
Important algorithms in DRL include deep Q networks [@mnih2013playing],
policy gradients based methods [@suttonReinforcementLearningIntroduction1998,
@schulmanProximalPolicyOptimization2017], Monte Carlo Tree Search
[@Silver_2016, @silverMasteringChessShogi2017],
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
mechanism[@vaswani_attentionallyou_2017] to select nodes. The structure is able
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
Improve was purposed by @luLearningbasedIterativeMethod2019 , which also generate
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
search space. @haffari_analysisstagealgorithm_ applied a TD-$\lambda$ based
algorithm STAGE to learn the evaluation function to evaluate the quality of the
initial state of local search and tested on bin packing problems. Similarly,
@caiReinforcementLearningDriven2019 uses reinforcement learning to generate an initial
solution for further heuristics optimisation. They also use the signal generated
by heuristics to optimise the training of RL model.
@silva-galvez_discoveringactionregions_2020 split bin packing problems into action
regions, and select suitable heuristics by a hyper-heuristic framework. Recent
researches also showed with the development of RL, a single RL solution for BPP
is possible. @balaji_orlreinforcementlearning_2019 purpose use Proximal Policy
optimisation(PPO) to solve online stochastic optimisation problems, including
BPP, VRP and newsvendor problem. 


The methods on higher dimension BPP are mixed according to what kind of problem
the researchers interested in. @kundu_deeppackvisionbased2d_2019 applied Convolutional
Neural Networks(CNN) [@lecunGradientbasedLearningApplied1998] to solve online 2D BPP.
@vermaGeneralizedReinforcementLearning2020 apply DQN to solve 3D BPP with only a single container.
They define movements for rectangle items and train DQN to select movements.
@huSolvingNew3D2017 apply policy-based network to produce item packing sequence
given original item sequence for 3D bin packing problems. The items will then
be packed using traditional heuristics. @zhao_online3dbin_2021 use CNN to encode
empty space for 3D BPP and then use constrained programming to find loading
position. For multiple bins, they use Monte Carlo permutation tree to adjust
the sequence of item input and then place items with previous mentioned
methods. @laterre_rankedrewardenabling_2018 purposed a self-competitive mechanism to train an
agent to beat the record generated by itself to solve 2D and 3D BPP. For
practical problems, @wangSelfplayLearningStrategies2021 used DRL to improve the resource
assignment in Open-RAN networks. 