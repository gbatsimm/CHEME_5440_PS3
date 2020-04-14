## CHEME_5440_PS3  by Gavin Batsimm
This is the third problem set for CHEME 5430 @ Cornell University, Spring 2020.  The problem set focuses on using FBA to model the Urea cycle in human cells.

### Files within the Repository
The first set of files are raw data files which are imported as .csv files.  This data was found from KEGG and Park et al. 

``stoichiometric_Array.csv`` gives the balanced six main reactions and 15 subsidiary reactions.  It effectively constrains the problem to only operate with accurate stoichiometry.

``stoichArray_justV.csv`` gives the subset of the full stoichiometric array containing just the six principal reactions.

``atom_matrix.csv`` gives the elemental composition of each of the 18 relevant species which are all composed of C, H, N, O, P, and S.

``vBounds.csv`` dictates the minimum and maximum rates of each of the 21 listed reactions.  If vmin is negative, then the reaction is reversible.  Otherwise, it is modeled as irreversible.

``stoichArray_elementalBalances.xlsx`` is an excel sheet with labels containing the information housed in the preceding .csv files.  It is useful to know which reaction is labeled as which, and which species is which.


The next set of files are the ``.jl`` files.  These files are responsible for all the computation in the project.

``Include.jl`` ensures that all of the necessary packages have been loaded to the file path

``check_stoic_balances.jl`` ensures that the stoichiometric array was properly assemebled

``flux.jl`` uses linear programming to determine the Urea flux in the system

### Ensuring the Stoichiometric Array is Properly Balanced

By executing the following command, the user can test if the stoichiometric array is properly balanced:

```jl
  julia > include("check_stoic_balances.jl")
 ```
 This is done by multiplying the transpose of A=``atom_matrix.csv`` S=``stoichArray_justV.csv`` .  If the returned matix contains all zeros, then all six elements, C, H, N, O, P, and S are balanced across all six principle reactions.
 
 ### Estimating Fluxes
 
 The Urea flux is first found by providing bounds on the reaction rate of each of the 21 reactions from ``vBounds.csv``.  The upper and lower bounds of each species is defined as zero, as the entire system is in steady state.  
 
 The following commands are issued:
 
 ```jl
    julia > include("flux.jl")
    julia > calculate_optimal_flux_distributions(S,speciesBounds,reactionBounds,object;min_flag=true)
 ```
 This returns several values, including ``objective_value`` which is the Urea flux, and ``calculated_flux_array`` which is the flux distribution.  I found the Urea optimal flux to be ____mmol/gDW-hr.
