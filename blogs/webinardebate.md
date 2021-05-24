---
layout: page
title: A Bottom-up Approach to Epidemic Modeling: Conceptual Framework, Implementation, and Case Study by Xun Shi and Meifang Li
---

This is my preparation for the dabate on a webinar presented by Xun Shi regarding a bottom-up approach in GIS for Friday, May 14.

## Notes from webinar:

### Review of alternative:
### Top down approach
  - goal is to first establish global/general models or laws and then apply them to the entire problem
  - assumes each local space or individual subject is a substantiation of the global/general models or laws
  - the global/general models or laws can be in the form of a set of differential equations, statistical models, etc.
  - limitations: assumes controlled experiments, simplification through deduction and induction, deterministic...
  - current modeling of COVID-19 is top down
  - advantages: simply representation of real world, good at identifying general pattern, good for large region like country

### Bottom-up approach:
  - does not seek to build global/general model beforehand
    -builds relatively simple rules that are individualized for each case and applies these rules to local spaces/individuals to mimic the real-world
  - global/general patterns emerge from this process
  - motivation: hard to execute controlled experiments, simple bottom up rules are better than complex top down approach
  - "most if not all, complex phenomena are eventually outcomes of local simple phenomena and their interactions, and a complex phenomenon at the global/general scale can be modeled by applying simple rules to local spaces or individuals"
  - advantages: modeling local spaces and individuals, modeling stochastic processes, modeling interaction among local spaces and individuals, modeling progression, modeling based on simple rules, tries to represent complexity, good for small areas like cities
  - disadvantages: isn't trying to simplify or look at general patterns of real world, restriction to individual-level data and computational capacity

### Their approach (bottom up)
  - constructing individual-level trajectories
    - hard to track everyone all the time, also a lot of work to analyze this data and ran into data quality issues
    - used trajectory data instead which aggregated individual-level data
  - evaluating individual-level contacts (who infected who?)
    - consider both spatial and temporal trajectory overlaps and their buffers
    tries to take into account information from epidemiological investigations
  - building individual-level transmission chains
    - use the tree structure to represent individual-level transmission relationships
    - when there are multiple/many trees, they form an epidemic forest
    - construct the linkage based on information about contact between patients
  - derive characteristics of epidemic from empirical method (individuals) not analytical method (formulas)
    - can identify super-spreader events/individuals
  - simulating epidemic scenarios using derived characteristics

### Take-aways:
  - use both top down and bottom up in conjunction for modeling diseases


### Questions:
  - Ethics: data consent and enforcing protections on big data, how to reconcile that with open source?
