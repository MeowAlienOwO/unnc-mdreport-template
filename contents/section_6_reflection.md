---
bibliography: ['../ref.bib']
---

Reflection
=====

The progress of last year have significant progress though, the overall
performance is not as expected. This is mainly due to the factors from two
aspects: subjective factors and objective factors. Objective factors including
delay of AGV Lab set up, COVID-19 effect at the end of 2021, data availability
from the government and late participant of Amazon Last Mile Routing Challenge.
Some factors are critical, like lacking the access of government transport 
data. Since we cannot have high quality data, we cannot build up a simulator for 
the city hence no further research could be done. Such factors can be avoided if 
we could choose the data source more carefully, more formally. Some factors
do not have critical negative impact but delay the whole progress. In that case, 
our reaction is to put some work in the timeline earlier, like I decided
to finish BPP paper writing / Amazon competition once the AGV lab set up is delayed.

Another important factor is subjective factor. This factor is mainly the change
of methodology and related cost. I have changed the methodology for solving BPP
from DRL to more mixed-integer programming model. This not only let the
importance of DRL experiments become secondary, but also require me to study
more domain-specific knowledge, including mathematical programming techniques,
Gurobi solver and column-generation techniques. The changing of methodology also
makes maintaining code assets become difficult. At last, I achieved the object
that beat a well-known heuristic best-fit in most of the case. To a certain
degree, some cost, like the experiment of DRL can be considered necessary
during the research progress(and not wasted--we included part of the DRL work in
our paper). However, the procedure could be improved in following way:

1. Identify the research field and target conference/journal early to avoid 
necessary re-research
2. During the coding & experiment procedure, spend time cleaning up and maintain code 
to improve coding quality and automatic experiment
3. Start paper writing early to let others can help review part of the paper while experiments
is executing
4. Spend time understand the problem mathematically to avoid misunderstanding of idea
5. To some extent, I need to keep my own idea rather than fit others to avoid the cost of
switching racetrack.


Appendix
=====

\includepdf[pages=-,pagecommand={},width=\textwidth]{../images/pattern_based_learning.pdf}
