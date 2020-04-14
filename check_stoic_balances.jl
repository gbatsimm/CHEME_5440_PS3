#check_stoic_balances imports the atom matrix and stoichiometric matrix. 
#If epsilon returns all zeros, stoichiometric matrix is balanced.

#checks neccessary packages are in place
include("Include.jl")

#import atom matrix
A=Matrix(CSV.read("atom_matrix.csv",header=0));

#import stoichiometric array
S=Matrix(CSV.read("stoichArray_justV.csv",header=0));

#this should equal 0 if balanced
epsilon=transpose(A)*S  