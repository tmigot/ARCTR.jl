using ARCTR
using Test
using NLPModels
using JuMP

# first test the LDLt function
include("../src/Utilities/testLDLt.jl")

# test all solvers with the well known Woods test function
include("woods.jl")
nlp = MathProgNLPModel(woods(), name="woods")

global nbsolver = 2
for solver in ALL_solvers
    nbsolver += 1
    println(nbsolver,"  ",solver)
    (x, f, gNorm, iter, optimal, tired, status) = solver(nlp, verbose=true)
    @printf("%-15s  %8d  %9.2e  %7.1e  %5d  %5d  %6d  %s\n",
            nlp.meta.name, nlp.meta.nvar, f, gNorm,
            nlp.counters.neval_obj, nlp.counters.neval_grad,
            nlp.counters.neval_hprod, status)    #stats = run_solver(solver, model, verbose=false)
    #@test (all([stats...] .>= 0))
    @test optimal
    reset!(nlp)
end
