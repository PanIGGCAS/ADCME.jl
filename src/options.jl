export reset_default_options

########################### OptionsSparse ###########################
"""
    OptionsSparse

Options for sparse linear algebra.
"""
mutable struct OptionsSparse 
    auto_reorder::Bool 
    solver::String
    OptionsSparse() = new(true, "SparseLU")
end

########################### OptionsSparse ###########################
"""
    OptionsAutoML

Options for autoML.
"""
mutable struct OptionsAutoML 
    max_iter::Int64 
    verbose::Bool
    OptionsAutoML() = new(5, true)
end


########################### OptionsNewtonRaphson ###########################
"""
    OptionsNewtonRaphson_LineSearch

Options for the line search in the Newton Raphson algorithm.
"""
mutable struct OptionsNewtonRaphson_LineSearch
    c1::Float64
    ρ_hi::Float64
    ρ_lo::Float64
    iterations::Int64
    maxstep::Int64
    αinitial::Float64
    OptionsNewtonRaphson_LineSearch() = new(1e-4, 0.5, 0.1, 1000, 9999999, 1.0)
end

"""
    OptionsNewtonRaphson

Options for Newton Raphson related algorithms.
"""
mutable struct OptionsNewtonRaphson 
    max_iter::Int64 
    verbose::Bool 
    rtol::Float64
    tol::Float64
    LM::Float64
    linesearch::Bool 
    linesearch_options::OptionsNewtonRaphson_LineSearch
    OptionsNewtonRaphson() = new(100, false, 1e-12, 1e-12, 0.0, false, OptionsNewtonRaphson_LineSearch())
end

mutable struct OptionsTraining
    training::PyObject
    OptionsTraining() = new(placeholder(false))
end

######################################################
"""
    Options

The container of all options in ADCME. 
"""
mutable struct Options 
    sparse::OptionsSparse
    newton_raphson::OptionsNewtonRaphson
    training::OptionsTraining
    automl::OptionsAutoML
    Options() = new(OptionsSparse(), OptionsNewtonRaphson(), OptionsTraining(), OptionsAutoML())
end


"""
    reset_default_options()

Results the ADCME options to default. 
"""
function reset_default_options()
    global options
    options = Options()
end