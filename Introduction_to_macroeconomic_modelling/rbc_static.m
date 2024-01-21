function [residual, g1, g2, g3] = rbc_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 3, 1);

%
% Model equations
%

T10 = y(3)^params(4);
T19 = y(1)^(params(1)-1);
T27 = y(1)^params(1);
lhs =1/T10;
rhs =params(2)/T10*(1+params(1)*y(2)*T19-params(5));
residual(1)= lhs-rhs;
lhs =y(3)+y(1);
rhs =y(2)*T27+y(1)*(1-params(5));
residual(2)= lhs-rhs;
lhs =y(2);
rhs =1-params(3)+y(2)*params(3)+x(1);
residual(3)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(3, 3);

  %
  % Jacobian matrix
  %

T52 = getPowerDeriv(y(3),params(4),1);
  g1(1,1)=(-(params(2)/T10*params(1)*y(2)*getPowerDeriv(y(1),params(1)-1,1)));
  g1(1,2)=(-(params(2)/T10*params(1)*T19));
  g1(1,3)=(-T52)/(T10*T10)-(1+params(1)*y(2)*T19-params(5))*(-(params(2)*T52))/(T10*T10);
  g1(2,1)=1-(1-params(5)+y(2)*getPowerDeriv(y(1),params(1),1));
  g1(2,2)=(-T27);
  g1(2,3)=1;
  g1(3,2)=1-params(3);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],3,9);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],3,27);
end
end
end
end
