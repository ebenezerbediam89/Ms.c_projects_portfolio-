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

residual = zeros( 7, 1);

%
% Model equations
%

T45 = exp(x(1))*y(3)^params(3);
T46 = y(4)^(1-params(3));
lhs =1/y(7);
rhs =params(1)/y(7)*(1+y(5)-params(2));
residual(1)= lhs-rhs;
lhs =params(4)/(1-y(4));
rhs =y(6)/y(7);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =y(4)*y(6)+(1+y(5)-params(2))*y(3)-y(3);
residual(3)= lhs-rhs;
lhs =y(5);
rhs =exp(x(1))*(y(4)/y(3))^(1-params(3));
residual(4)= lhs-rhs;
lhs =y(6);
rhs =exp(x(1))*(y(3)/y(4))^params(3);
residual(5)= lhs-rhs;
lhs =y(1);
rhs =T45*T46;
residual(6)= lhs-rhs;
lhs =y(2);
rhs =y(1)-y(7);
residual(7)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(7, 7);

  %
  % Jacobian matrix
  %

T57 = getPowerDeriv(y(4)/y(3),1-params(3),1);
T62 = getPowerDeriv(y(3)/y(4),params(3),1);
  g1(1,5)=(-(params(1)/y(7)));
  g1(1,7)=(-1)/(y(7)*y(7))-(1+y(5)-params(2))*(-params(1))/(y(7)*y(7));
  g1(2,4)=params(4)/((1-y(4))*(1-y(4)));
  g1(2,6)=(-(1/y(7)));
  g1(2,7)=(-((-y(6))/(y(7)*y(7))));
  g1(3,3)=(-(1+y(5)-params(2)-1));
  g1(3,4)=(-y(6));
  g1(3,5)=(-y(3));
  g1(3,6)=(-y(4));
  g1(3,7)=1;
  g1(4,3)=(-(exp(x(1))*(-y(4))/(y(3)*y(3))*T57));
  g1(4,4)=(-(exp(x(1))*T57*1/y(3)));
  g1(4,5)=1;
  g1(5,3)=(-(exp(x(1))*1/y(4)*T62));
  g1(5,4)=(-(exp(x(1))*T62*(-y(3))/(y(4)*y(4))));
  g1(5,6)=1;
  g1(6,1)=1;
  g1(6,3)=(-(T46*exp(x(1))*getPowerDeriv(y(3),params(3),1)));
  g1(6,4)=(-(T45*getPowerDeriv(y(4),1-params(3),1)));
  g1(7,1)=(-1);
  g1(7,2)=1;
  g1(7,7)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,49);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],7,343);
end
end
end
end
