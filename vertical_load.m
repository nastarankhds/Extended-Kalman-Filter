function [fzf,fzr] = vertical_load(par,ay,ax)

m = par.m;
lf = par.lf;
lr = par.lr;
g = par.g;
l = par.l;
hg = par.hg;
track_f = par.track_f;
track_r = par.track_r;

% for Single Track Model

fzfl = (m*g*lr)/(2*l) - (m*hg*ax)/(2*l) - (m*hg*lr*ay)/(track_f*l)...
        - (m*ax*ay*hg^2)/(g*l*track_f);

fzfr = (m*g*lr)/(2*l) - (m*hg*ax)/(2*l) + (m*hg*lr*ay)/(track_f*l)...
    + (m*ax*ay*hg^2)/(g*l*track_f);

fzrl = (m*g*lf)/(2*l) + (m*hg*ax)/(2*l) - (m*hg*lf*ay)/(track_r*l)...
    + (m*ay*ax*hg^2)/(g*track_r *l);

fzrr = (m*g*lf)/(2*l) + (m*hg*ax)/(2*l) + (m*hg*lf*ay)/(track_r*l)...
    - (m*ay*ax*hg^2)/(g*track_r *l);

    % for Single Track Model
    fzf = fzfl + fzfr;
    fzr = fzrl + fzrr;


end