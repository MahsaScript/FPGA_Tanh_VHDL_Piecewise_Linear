function []=tanh_lookup()
    problem = FunctionApproximation.Problem('tanh');
    problem.InputTypes =  numerictype(1,16,12);
    problem.InputLowerBounds = -4;
    problem.InputUpperBounds = 4;
    problem.OutputType = numerictype(1,16,15);
    problem.Options.BreakpointSpecification='EvenSpacing'; %hardware friendly power2
    problem.Options.WordLengths=16; %[4,8,14, 16, 32]
    problem.Options.OnCurveTableValues=0;
    solution = solve(problem);
    compare(solution);
    approximate(solution);
    memory = totalmemoryusage(solution);
    disp(memory);
end