include("Include.jl")

#import atom matrix
A=Matrix(CSV.read("atom_matrix.csv",header=0));

#import stoichiometric array
S=Matrix(CSV.read("stoichArray_justV.csv",header=0));

#this should equal 0 if balanced
epsilon=transpose(A)*S  