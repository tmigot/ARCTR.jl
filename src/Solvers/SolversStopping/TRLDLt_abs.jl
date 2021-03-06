export TRLDLt_abs

function TRLDLt_abs(nlp 		:: AbstractNLPModel,
              		nlpstop 	:: NLPStopping;
					kwargs...
               			)

	return TRARC2(nlp,
				  nlpstop;
				  TR = TrustRegion(10.0),
				  c = Combi(hessian_dense, PDataLDLt{eltype(nlp.meta.x0)}, solve_modelTRDiagAbs, preprocessLDLt, decreaseFact, Tparam{eltype(nlp.meta.x0)}()),
				  kwargs...
				  )
end
