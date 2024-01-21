function [residual, g1, g2, g3] = rbc_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(7, 1);
T42 = exp(x(it_, 1))*(y(4)/y(3))^(1-params(3));
T46 = exp(x(it_, 1))*(y(3)/y(4))^params(3);
T50 = exp(x(it_, 1))*y(3)^params(3);
T51 = y(4)^(1-params(3));
lhs =1/y(7);
rhs =params(1)/y(10)*(1+y(9)-params(2));
residual(1)= lhs-rhs;
lhs =params(4)/(1-y(4));
rhs =y(6)/y(7);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =y(4)*y(6)+(1+y(5)-params(2))*y(3)-y(8);
residual(3)= lhs-rhs;
lhs =y(5);
rhs =T42;
residual(4)= lhs-rhs;
lhs =y(6);
rhs =T46;
residual(5)= lhs-rhs;
lhs =y(1);
rhs =T50*T51;
residual(6)= lhs-rhs;
lhs =y(2);
rhs =y(1)-y(7);
residual(7)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(7, 11);

  %
  % Jacobian matrix
  %

T61 = getPowerDeriv(y(4)/y(3),1-params(3),1);
T66 = getPowerDeriv(y(3)/y(4),params(3),1);
  g1(1,9)=(-(params(1)/y(10)));
  g1(1,7)=(-1)/(y(7)*y(7));
  g1(1,10)=(-((1+y(9)-params(2))*(-params(1))/(y(10)*y(10))));
  g1(2,4)=params(4)/((1-y(4))*(1-y(4)));
  g1(2,6)=(-(1/y(7)));
  g1(2,7)=(-((-y(6))/(y(7)*y(7))));
  g1(3,3)=(-(1+y(5)-params(2)));
  g1(3,8)=1;
  g1(3,4)=(-y(6));
  g1(3,5)=(-y(3));
  g1(3,6)=(-y(4));
  g1(3,7)=1;
  g1(4,3)=(-(exp(x(it_, 1))*(-y(4))/(y(3)*y(3))*T61));
  g1(4,4)=(-(exp(x(it_, 1))*T61*1/y(3)));
  g1(4,5)=1;
  g1(4,11)=(-T42);
  g1(5,3)=(-(exp(x(it_, 1))*1/y(4)*T66));
  g1(5,4)=(-(exp(x(it_, 1))*T66*(-y(3))/(y(4)*y(4))));
  g1(5,6)=1;
  g1(5,11)=(-T46);
  g1(6,1)=1;
  g1(6,3)=(-(T51*exp(x(it_, 1))*getPowerDeriv(y(3),params(3),1)));
  g1(6,4)=(-(T50*getPowerDeriv(y(4),1-params(3),1)));
  g1(6,11)=(-(T50*T51));
  g1(7,1)=(-1);
  g1(7,2)=1;
  g1(7,7)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,121);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],7,1331);
end
end
end
end
