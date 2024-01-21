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

residual = zeros(3, 1);
T10 = y(5)^params(4);
T14 = y(7)^params(4);
T15 = params(2)/T14;
T21 = y(3)^(params(1)-1);
T31 = y(1)^params(1);
lhs =1/T10;
rhs =T15*(1+params(1)*y(6)*T21-params(5));
residual(1)= lhs-rhs;
lhs =y(5)+y(3);
rhs =y(4)*T31+y(1)*(1-params(5));
residual(2)= lhs-rhs;
lhs =y(4);
rhs =1-params(3)+params(3)*y(2)+x(it_, 1);
residual(3)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(3, 8);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-(T15*params(1)*y(6)*getPowerDeriv(y(3),params(1)-1,1)));
  g1(1,6)=(-(T15*params(1)*T21));
  g1(1,5)=(-(getPowerDeriv(y(5),params(4),1)))/(T10*T10);
  g1(1,7)=(-((1+params(1)*y(6)*T21-params(5))*(-(params(2)*getPowerDeriv(y(7),params(4),1)))/(T14*T14)));
  g1(2,1)=(-(1-params(5)+y(4)*getPowerDeriv(y(1),params(1),1)));
  g1(2,3)=1;
  g1(2,4)=(-T31);
  g1(2,5)=1;
  g1(3,2)=(-params(3));
  g1(3,4)=1;
  g1(3,8)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],3,64);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],3,512);
end
end
end
end
