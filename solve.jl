#solve runs flux with the desired data files
include("Include.jl")
include("flux.jl")
using GLPK

stoicMat=Matrix(CSV.read("stoichiometric_Array.csv"))
reactionBounds=Matrix(CSV.read("vBounds.CSV"))
speciesBounds=Matrix(CSV.read("speciesBounds.csv"))
objective=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]

objective_value, calculated_flux_array, dual_value_array, uptake_array, exit_flag,status_flag = calculate_optimal_flux_distribution(stoicMat,reactionBounds,speciesBounds,objective;minFlag=true)
print(objective_value)