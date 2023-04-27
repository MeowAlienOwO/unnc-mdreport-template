---
bibliography: ['../ref.bib']
---

Works done so far
=====
The work in second year mainly consists two parts. First, I have finished a
paper about a stochastic online 1D-BPP solution based on pricing concept and
pattern recognition, which is recently submitted to IJCAI 22. Second,
I have participated the Amazon Last Mile Challenge. This problem can be simply
described as TSP with human-factor and uncertainty. This part will discuss the
key point of these two works.

## Pattern based learning through pricing for the bin packing problem with finite types

We describe the major problem to be solved as online stochastic 1D-BPP with
priori knowledge. The mathematical formulation is similar as Equation
\ref{eq:bpp_formulation}. The online property of the problem means the item
should be packed immediately once received. The type of items kept discrete and
finite. The exact number of different types as well as the incoming sequence are
unknown to the decision maker. However, in this work, we allow the algorithm
have some priori knowledge, i.e. the expected number of type in the whole
sequence. Most of the online heuristics of BPP have only knowledge of item
types. In this work, we purpose to use the distribution knowledge to help
to plan, hence achieve better results.

The difficulty of these problems is the trivial change on the items could have
big affect on the optimal solution. Following table showed two cases: the two
case share the same types, the number of types differed in both case. The
bracket represents a packing of a bin, we call one type of packing as a pattern.
If a system learned the pattern from optimal solution of case 1, it will
unlikely to perform good in Case 2. In this case, we can identify the value of
patterns are different given different problem instance, even the type of items
are similar.

<!-- LTeX: enabled=false -->

                      Case 1                  Case 2                                    
------------------   ---------------------   -------------------------------------------
 Items                2x2, 3x1, 4x2, 5x1      2x6, 3x5, 4x2, 5x1                        
 Best Fit             (5,4), (4,3,2), (2)     (5,4), (4,3,3), (3,3,3), (2,2,2,2,2), (2) 
 Optimal Solution     (5,3,2), (4,4,2)        (5,3,2), (4,3,3), (4,3,3), (2,2,2,2,2)    

<!-- LTeX: enabled=true -->

Table: 1D BPP instance example 

In this work, we purpose using the pricing method to guide the pattern
recognition and generate problem solution. A pricing method is a way to evaluate
how important each pattern is in the problem instance. We introduce the concept:
duality of linear/integer linear programming. Duality is the principle that an
optimisation problem could be viewed as two problems: the primal problem and
dual problem. We write a general form of primal problem as following:

<!-- LTeX: enabled=false -->
\begin{eqnarray}
\textbf{primal:~~~~~~} 
\mbox{minimise} \quad    & f(\mathbf{x}) &  \label{eq:primal_obj}   \\
\mbox{subject to:} \quad &  u_i(\mathbf{x}) \ge 0 &  i=1,\cdots, m \label{eq:primal_inequation_const}\\
& v_j(\mathbf{x}) = 0   &  j=1,\cdots, n\label{eq:primal_equal_const}
\end{eqnarray}
<!-- LTeX: enabled=true -->

We can then write the associated Lagrange function as follows:
$L(\mathbf{x}, \lambda, \eta) = f(\mathbf{x}) + \sum_{i=1}^m\lambda_i u_{i}(\mathbf{x}) + \sum_{j=1}^n \eta_j v_j(\mathbf{x})$
where $\lambda, \eta$ are non-negative Lagrange multipliers. If we have optimal
$x^*$, denote $g(\lambda, \eta) = \inf_x L(x,\lambda, \eta)$ to be dual problem.
By solving the dual problem, we obtain optimal $\lambda^*, \eta^*$ and objective
value of dual problem. The objective value of dual problem represents shadow
price. In our problem, shadow price can be seen as the value of pattern.
@fordSuggestedComputationMaximal1958 represent column generation method that
uses similar idea to solve large-scale linear programming and later this idea is
applied to many other optimization problems. In this work, we followed a similar
approach as column generation to solve our problem.

<!-- LTeX: enabled=false -->
\begin{figure}[t]
\centering
\includegraphics[width=0.7\textwidth]{../images/BPP_Framework.pdf}
\caption{The proposed pattern based packing algorithm. We first use the duality
of algorithm to generate a set of patterns, then use the pattern set to build
problem solving strategy for an online problem. A state monitor module is used
to check whether we should re-generate the pattern set according to the new
state.}
\label{fig:bpp_framework}
\end{figure}
<!-- LTeX: enabled=true -->

The major contribution of our work is a general framework that introduce pricing
as a key factor for solving COP. Figure~\ref{fig:bpp_framework} represents the
framework structure. We briefly describe the algorithm process as follows:
First, we use column generation to generate a set of patterns and the number it
will be used in the instance given the expected number of types. We first simply
follow the plan to pack the item by following procedure:

1. Assign each bin with a pattern, i.e. consider a bin is "cut off" with several
   pieces that can exactly store one certain type.
2. Once the item comes, find a empty piece of that type of item and put it into
   the bin.

We use a state monitor to detect whether the plan should be changed. This usually
happens when there is no more empty pieces for a certain type. Once detected, we
will predict the number of types of incoming items, and re-generate plan
according to prediction. The planning procedure is simply doing column
generation on the expected whole sequence or prediction of sub-sequence. 

We made several experiments with stationary distribution, non-stationary
distribution and mixed distribution. We compared our work with simple DRL model
and Best Fit heuristics, shown better performance in most case if we have good
prediction quality. By the time of writing annual report, this work was
submitted to IJCAI 22 and waiting for review. The paper is appended at the
appendix part of this report.


## Amazon Last Mile Routing Challenge

Amazon Last Mile Routing Challenge [@mitAmazonLastMile2021] is aiming to solve
real-world delivery problem which have highly uncertainty due to real-world
routing network and human factors. It provides large dataset based on the
logistic practice of Amazon and require participants to analyse data and come
up with models that guiding the routing procedure, so that the quality of
route will be close to high-quality human generated routes.

The Last Mile Routing problem can be viewed as a TSP problem with complex route
net and human factor. The delivery happens in some big US cities, like New
Yorks, Chicago, Miami, etc. The package will all store in a single depot which
might be far away from the town centre. Several (30-120+) delivery targets are
identified, and the driver need to deliver the package to target delivery
targets, while there is only one depot for each problem instance. Some
delivery targets have time window that will penalize the solution if violated.
The solution is described as traverse sequence of the point set including depot
and delivery targets. A training dataset is given to the participants to build
model, with high, medium and low quality labelled. The evaluation procedure will
compare the sequence similarity between generated solution and known high
quality human decision. An averaged similarity score will be calculated across
the evaluation dataset to give the final result.

We have built two models for this problem: two-stage TSP and TSP-ML model. A
two-stage TSP consider the problem as two steps: first cluster the points into
groups, then solve TSP across and within the group. We assume that the points
within same zone property should be naturally group together and distance between
them will be short in general. In that case, we decompose the points in a
problem instance into two-stages. First, we consider the zone as a single point
and generate TSP traverse sequence for those zones. The distance between zone is
defined as the shortest distance of the point pairs $(p_{zone1}, p_{zone2})$.
Second, we identify the entry of exit of the zone by zone sequence, and do a
secondary TSP within the zone. Finally, the sub-TSP of each zone is combined to form a final solution. Since it is forbidden to use any commercial
solver, we implemented Variable Neighbourhood Search(VNS)
[@mladenovicVariableNeighborhoodSearch1997]for TSP and applied on both stages.
This method gives in average 0.2 solution quality score, in comparison: the
best solution of other team achieved 0.03.

The TSP-ML model trying to combine TSP with machine learning. The motivation is
trying to model the uncertainty with neural-network model to guide a single VNS
metaheuristic. We use VNS to solve the whole TSP problem, but instead of the
total distance as objective function to judge which solution is better, We use
the neural-network model as a discriminator to judge which solution is better
during the neighbourhood selection procedure. The algorithm pseudocode defined as
below.

<!-- ```pseudocode
Algorithm VNS-ML:
Input: route information, initial solution, theshold, judge net, max_iteration
Output: model solution

best_solution := initial_solution
For iteration -> 1..max_iteration
  For attemp -> 1..10
    next_solution = shake(best_solution)
    If iteration < theshold
      If total_length(best_solution) > total_length(next_solution)
        best_solution = next_solution
    Else
      If judge_net(feature(next_solution, best_solution, route_info)) > 0.5
        best_solution = next solution
        
Return best_solution     

Algorithm Train_Judge_Net:
Input: route information, judge net, max_epoch
Output: trained judge net

generate dataset by extract solution-based features from middle solutions in vns,
this vns use oracle metric between generated solution 
    and actual sequence as objectvive function
For epoch -> 1..max_epoch
  random choice two solution set sol_1 and sol_2
  let label := metric(sol_1) < metric(sol_2)
  train judge net by cross entropy(NLL in practice)
  
return judge net
``` -->

<!-- LTex: enabled=false -->
\begin{algorithm}[H]
\SetAlgoLined
\DontPrintSemicolon
\SetKwInOut{Input}{Input}
\SetKwInOut{Output}{Output}
\Input{route information, initial solution, theshold, judge net, max iteration}
\Output{model solution}

\BlankLine


BestSolution := InitialSolution\;
\For{Iteration := 1..MaxIteration>} {
  \For{Attempt := 1..10} {
    NextSolution := shake(BestSolution)\;
    \eIf{Iteration < Theshold} {
      \If{totalLength(BestSolution) > totalLength(NextSolution)} {
        BestSolution := NextSolution\;
      }
    } {
      \If {inference(feature(NextSolution, BestSolution, RouteInfo), JudgeNet) > 0.5} {
        BestSolution := NextSolution \;
      }

    }
  }

}
\caption{VNS-ML}

\end{algorithm}


\begin{algorithm}[H]
\SetAlgoLined
\DontPrintSemicolon
\SetKwInOut{Input}{Input}
\SetKwInOut{Output}{Output}
\Input{Route information, judge net, MaxEpoch}
\Output{trained judge net}

\BlankLine

 generate dataset by extract solution-based features from middle solutions in vns\;
\For{epoch := 1.. MaxEpoch} {

  random choice two solution set sol1 and sol2\;
  label := metric(sol1) < metric(sol2)\;
  train judge net by cross entropy(NLL in practice)\;

}
\caption{Train Judge Net}

\end{algorithm}

<!-- LTex: enabled=true -->

<!-- \begin{algorithm}[h]
\setalgolined
\dontprintsemicolon
\kwresult{result}
\setkwinout{input}{input}
\setkwinout{output}{output}
\input{write input}
\output{write output}

\blankline
\while{while cond} {
  instructions1\;
  instructions2\;

} \eif{condition}{
  instructions3\;

} {
  instructions4\;
}
\caption{while loop if/else}

\end{algorithm} -->

<!-- The VNS-ML solution failed to achieve good result  -->

The training of the discriminator (ML judger) achieved 80\% accuracy. We use both 
single solution features and features across two solution: 

1. Single solution
  - Total length
  - Time\_window violation count
  - Zone re-enter rate
  - Number of line crossed by (latitude, longitude) coordinate. If line cross appears very
    often, we could argue that the route has backtracked.
  - Number of three continuous points shares same line. If this value is high we
    could argue there are many parts in the sequence are in same straight road.

2. Cross solution
  - Length difference weighted by total length
  - Time window validation difference

Although achieved 80% accuracy, we strongly adopt this is due to the rate of
low-quality solution is very high in the dataset. It is very easy to distinguish
solutions between very low-quality solution(i.e. > 0.5) with some
middle(0.5~0.1) or high quality(<0.1) solution. However, for those solutions are
not that worse, it might be hard to distinguish the qualities between them under
hand-crafted rules. Whether it is worth to create a good enough set of features
that could perfectly distinguish suboptimal and optima solutions are
questionable.

The VNS-ML solution in general failed to achieve meaningful solution. Since the
output of our machine learning model is considered as probabilistic
distribution, the performance of VNS is hence strongly effected. In other word,
it is not suitable to combine our VNS implementation with any form of objective
function that involves uncertainty. Consider a 100-points standard TSP. We experiment with situations as follows:

1. 100% accept if total length of candidate solution is smaller than known best
2. 90% accept if total length of candidate solution is smaller than known best, 10% vice versa
3. same as 2 but probability 80%-20% 

<!-- \ref{fig:vns-ml}. -->
The result is shown in Figure 2.
Probabilistic-involved objective function
makes the solution much worse. Meanwhile, the lower correct probability, the
higher standard deviation the solution has. Since the accuracy of judge net
reached only 90% in training set and validation set, we should not expect that
such unstable VNS solution could converge to acceptable stage. In fact, in
experiment on Routing Challenge data, we observed that the performance are much
worse than VNS with only total length as objective function.
<!-- 
\begin{figure}[htbp]
\centering
    \begin{minipage}[t]{0.45\textwidth}
    \label{fig:vns-ml-1}
    \centering
        \includegraphics[width=4cm]{../images/image-20210724202723584.png}
        \caption{100\% accept rate}
    \end{minipage}

    \begin{minipage}[t]{0.45\textwidth}
    \label{fig:vns-ml-2}
    \centering
        \includegraphics[width=4cm]{../images/image-20210724202814606.png}
        \caption{90\% accept rate}
    \end{minipage}

    \begin{minipage}[t]{0.45\textwidth}
    \label{fig:vns-ml-3}
    \centering
        \includegraphics[width=4cm]{../images/image-20210724204305988.png}
        \caption{80\% accept rate}
    \end{minipage}
\end{figure} -->

<!-- LTeX: enabled=false -->

\begin{figure}[htbp]
    \centering
    \subfigure[100\% accept rate]{ 
    \begin{minipage}{6cm}
    \centering 
    \includegraphics[]{../images/image-20210724202723584.png}
    \end{minipage}
    }
    \subfigure[90\% accept rate]{ 
    \begin{minipage}{6cm}
    \centering
    \includegraphics[]{../images/image-20210724202814606.png}
    \end{minipage}
    }
    \centering
    \subfigure[80\% accept rate]{ 
    \begin{minipage}{6cm}
    \centering 
    \includegraphics[]{../images/image-20210724204305988.png}
    \end{minipage}
    }
    \label{fig:vns-ml}
    \caption{VNS-ML experiments}
\end{figure}

<!-- LTeX: enabled=true -->
