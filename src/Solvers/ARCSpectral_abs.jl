export ARCSpectral_abs

function ARCSpectral_abs(nlp 		:: AbstractNLPModel,
               		     nlpstop 	:: NLPStopping;
					     kwargs...
               		     )

	return TRARC(nlp,
				  nlpstop;
				  TR = TrustRegion(10.0),
				  c = Combi(ARCTR.hessian_dense, ARCTR.PDataSpectral{eltype(nlp.meta.x0)}, ARCTR.solve_modelARCDiagAbs, ARCTR.preprocessSpectral, ARCTR.decreaseFact, ARCTR.Tparam{eltype(nlp.meta.x0)}()),
				  kwargs...
				  )
end
