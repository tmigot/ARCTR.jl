export ALL_solvers_stopping

# Valid combinations

ALL_solvers_stopping = Function[]

include("ARCSpectral.jl")
push!(ALL_solvers_stopping, ARCSpectral)

include("ARCSpectral_abs.jl")
push!(ALL_solvers_stopping, ARCSpectral_abs)


include("TRSpectral.jl")
push!(ALL_solvers_stopping, TRSpectral)

include("TRSpectral_abs.jl")
push!(ALL_solvers_stopping, TRSpectral_abs)


include("ARCLDLt.jl")
push!(ALL_solvers_stopping, ARCLDLt)

include("ARCLDLt_abs.jl")
push!(ALL_solvers_stopping, ARCLDLt_abs)


include("TRLDLt.jl")
push!(ALL_solvers_stopping, TRLDLt)

include("TRLDLt_HO.jl")
push!(ALL_solvers_stopping, TRLDLt_HO)

include("TRLDLt_BBK.jl")
push!(ALL_solvers_stopping, TRLDLt_BK)

include("TRLDLt_HO_Sham.jl")
push!(ALL_solvers_stopping, TRLDLt_HO_Sham)

include("TRLDLt_HO_Sham_lambda.jl")
push!(ALL_solvers_stopping, TRLDLt_HO_Sham_λ)

include("TRLDLt_HO_Sham_BFGS.jl")
push!(ALL_solvers_stopping, TRLDLt_HO_Sham_BFGS)

# include("TRLDLt_HO_MP.jl")                # Still a work in progress
# push!(ALL_solvers_stopping, TRLDLt_HO_MP)

include("TRLDLt_abs.jl")
push!(ALL_solvers_stopping, TRLDLt_abs)


include("ARCqKOp.jl")
push!(ALL_solvers_stopping, ARCqKOp)

include("ARCqKOp1.jl")
push!(ALL_solvers_stopping, ARCqKOp1)

include("ARCqKOp1b.jl")
push!(ALL_solvers_stopping, ARCqKOp1b)

include("ARCqKOp2.jl")
push!(ALL_solvers_stopping, ARCqKOp2)

include("ARCqKOp0_5.jl")
push!(ALL_solvers_stopping, ARCqKOp05)

include("ARCqKSparse.jl")
push!(ALL_solvers_stopping, ARCqKsparse)

include("ARCqKdense.jl")
push!(ALL_solvers_stopping, ARCqKdense)


include("TRKOp.jl")
push!(ALL_solvers_stopping, TRKOp)

include("TRKsparse.jl")
push!(ALL_solvers_stopping, TRKsparse)

include("TRKdense.jl")
push!(ALL_solvers_stopping, TRKdense)


include("ST_TROp.jl")
push!(ALL_solvers_stopping, ST_TROp)

include("ST_TROp_Sham.jl")
push!(ALL_solvers_stopping, ST_TROp_Sham)

include("ST_TROp_Sham_BFGS.jl")
push!(ALL_solvers_stopping, ST_TROp_Sham_BFGS)

include("ST_TRsparse.jl")
push!(ALL_solvers_stopping, ST_TRsparse)

include("ST_TRdense.jl")
push!(ALL_solvers_stopping, ST_TRdense)


include("ST_ARCOp.jl")
push!(ALL_solvers_stopping, ST_ARCOp)

include("ST_ARCsparse.jl")
push!(ALL_solvers_stopping, ST_ARCsparse)

include("ST_ARCdense.jl")
push!(ALL_solvers_stopping, ST_ARCdense)


include("ARCMA97.jl")
push!(ALL_solvers_stopping, ARCMA97)

include("ARCMA97_abs.jl")
push!(ALL_solvers_stopping, ARCMA97_abs)

include("TRMA97.jl")
push!(ALL_solvers_stopping, TRMA97)

include("TRMA97_abs.jl")
push!(ALL_solvers_stopping, TRMA97_abs)

include("ARCMA57.jl")
push!(ALL_solvers_stopping, ARCMA57)

include("ARCMA57_abs.jl")
push!(ALL_solvers_stopping, ARCMA57_abs)

include("TRMA57.jl")
push!(ALL_solvers_stopping, TRMA57)

include("TRMA57_Sham.jl")
push!(ALL_solvers_stopping, TRMA57_Sham)

include("TRMA57-2.jl")
push!(ALL_solvers_stopping, TRMA57_2)

include("TRMA57_Sham_2.jl")
push!(ALL_solvers_stopping, TRMA57_Sham_2)

include("TRMA57_Sham_BFGS.jl")
push!(ALL_solvers_stopping, TRMA57_Sham_BFGS)

include("TRMA57_abs.jl")
push!(ALL_solvers_stopping, TRMA57_abs)
