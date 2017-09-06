function solve_modelTRDiagAbs(PData :: PDataFact, δ:: Float64)
    # Solve the TR subproblem once diagonalized into Δ using the norm |Δ|
    

    # Setup the subproblem to recover identity regularizing matrix
    # Should this be in pre-process so that PData.λ is indeed used as updated?
    #
    ḡ = PData.g̃
    n_g = norm(ḡ)
    ϵ =  1.0e-10 # *n_g
    Γ2 = max(abs(PData.Δ),ϵ)
    Γ = sqrt(Γ2)

    Δ̄ = Γ .\ PData.Δ ./ Γ
    Δ = PData.Δ
    if PData.success    # initialize λmin, take care of hard case and Newton's direction interior
        l_m,i = findmin(Δ̄)
        λ = max(-l_m,0.0)
        λmin = max(ϵ,  λ + ϵ * (1.0 + λ)) #λ + ϵ #max(λ*(1+ϵ), ϵ)

        d̄ = -(Δ+λmin*Γ2) .\ ḡ
        normd_2 = (d̄⋅ (Γ2 .\ d̄))
        #if isnan(normd_s)  @bp end
        if normd_2 < δ*δ
            if λ != 0.0  # λ == 0 is Newton's direction, nothing to do...
                println(" hard case")
                #bidon, i = findmin(Δ)
                d̄[i] =0.0; d̄[i] = - sign(PData.g̃[i]) * sqrt(δ^2 - normd_2)
            end
        else
            #println(" easy case normd_s = $normd_s")
            d̄,λ = solve_diagTR(λmin,Δ,ḡ,δ,ϵ, M=Γ2)
        end
    else # hard case impossible, λ already > λ_min
        # Solve the subproblem (Δ + λ I) d_s = -g_s such that δ = ||d_s||
        #println(" retry for success case")
        d̄,λ = solve_diagTR(PData.λ,Δ,ḡ,δ,ϵ, M=Γ2)
    end

    PData.λ = λ

    # Transform back d̄ into d
    d̃ = d̄ #Γ .\ d̄
    d = AInv(PData,d̃)  
    #try assert((PData.g̃ + 0.5*PData.Δ .* d̃)⋅d̃ <= 0.0)  catch  @bp  end
#println("*******SolveModelDiagAbs:  PData.g̃⋅d̃ = $(PData.g̃⋅d̃), 0.5 d̃'PData.Δd̃ = $(0.5*(PData.Δ .* d̃)⋅d̃)")
    return d, λ
end
