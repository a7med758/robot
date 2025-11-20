% Extract timeseries from scope logging
ts = ScopeData{1}.Values;

% Extract time and data
t = ts.Time;
x = ts.Data;

% ===========================
% 1) TRUNCATE at 1.55 seconds
% ===========================

tEnd = 1.55;                 % desired cutoff time
idx = t <= tEnd;             % logical index of samples before 1.55 sec

t_cut  = t(idx);             % truncated time
x_cut  = x(idx,:);           % truncated data (works if 1 or many signals)

% =================================
% 2) REVERSE the truncated signals
% =================================

x_rev = flipud(x_cut);       % reverse the truncated data

% Create reversed timeseries
revTS = timeseries(x_rev, t_cut);
revTS.Name = ts.Name;
