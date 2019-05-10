export solve_modelTRDiag_HO_3

"""
If the Newton direction is accepted, then we use the high order correction.
"""
function solve_modelTRDiag_HO_3(nlp_stop, PData :: PDataFact, δ:: T; ho_correction :: Function = Shamanskii) where T
    # Solve the TR subproblem once diagonalized into Δ using the norm |Δ|
    # Setup the problem
    # printstyled("dans solve_modelTRDiag eltype(PData.λ) = $(eltype(PData.λ)) \n", color = :yellow)
    M = T.(fill(1.0, size(PData.Δ)))
    ϵ = sqrt(eps(T)) / 100.0
    ϵ2 = T.(ϵ * (1.0 + PData.λ))
    # printstyled("on est rentré dans solve_modelTRDiag_HO_3\n", color = :yellow)

    if PData.success # take care of eventual hard case and Newton's direction interior (λ = 0)
        # (PData.Δ + PData.λ * M) ⪰ 0
        λ = max(ϵ2, PData.λ + ϵ2) # to make sure (PData.Δ + λ * M) ≻ 0

        d̃ = -(PData.Δ .+ λ * M) .\ PData.g̃ # Ajouter Shamanskii ici!
        normd̃ = sqrt(d̃⋅d̃)
        normg̃ = sqrt(PData.g̃⋅PData.g̃)
        if normd̃ < δ
            if PData.λ == 0.0 # Newton's direction
                λ = PData.λ
                if normg̃ < 1e-1
                    dtemp1 = AInv(PData, d̃)
                    dtemp, xdemi = ho_correction(nlp_stop, PData, dtemp1, PData.g̃)
                    dHO = dtemp
                    return dHO, xdemi, λ
                end
                # println(" Newton's direction inside the region")
                #  d̃ is the Newton's direction, nothing more to do
            else              # hard case
                ##println(" hard case")
                bidon, i = findmin(PData.Δ)
                d̃[i] = 0.0; d̃[i] = - sign(PData.g̃[i]) * sqrt(δ^2 - d̃⋅d̃)
            end
        else
            d̃,λ = solve_diagTR(λ, PData.Δ, PData.g̃, δ, ϵ)
        end
    else # hard case impossible, λ already > λ_min
        # println("on est dans le cas !(PData.success)")
        # Solve the subproblem (Δ + λ I) d̃ = -g̃ such that ||d̃|| = δ
        d̃, λ = solve_diagTR(PData.λ, PData.Δ, PData.g̃, δ, ϵ)
    end

    PData.λ = λ

    # Transform back d̃ into d
    d = AInv(PData, d̃)

    #try assert((PData.g̃ + 0.5*PData.Δ .* d̃)⋅d̃ <= 0.0)  catch  @bp  end
    return d, NaN * rand(length((d))), λ
end