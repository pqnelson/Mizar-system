%outputtemplate := "%j-%c.eps";

numeric u; u := 1pc;

beginfig(0)
  picture AppendFunc,GetArguments,TermSubexpression,GetClosedSubterm;
  z0 = (0,0);
  AppendFunc = thelabel.top(btex AppendFunc etex, z0);
  z1 = 0.5[llcorner AppendFunc, lrcorner AppendFunc] - (0,2u);
  GetArguments = thelabel(btex GetArguments etex, z1);
  z2 = 0.5[lrcorner GetArguments, urcorner GetArguments] + (2u,0);
  TermSubexpression = thelabel.rt(btex TermSubexpression etex, z2);
  z3 = 0.5[llcorner TermSubexpression, lrcorner TermSubexpression] - (0,2u);
  GetClosedSubterm = thelabel.bot(btex GetClosedSubexpression etex, z3);

  draw AppendFunc; draw (bbox AppendFunc);
  draw GetArguments; draw (bbox GetArguments);
  draw TermSubexpression; draw (bbox TermSubexpression);
  draw GetClosedSubterm; draw (bbox GetClosedSubterm);
  drawarrow (ulcorner GetClosedSubterm)--(lrcorner GetArguments) cutafter (bbox
  GetArguments) cutbefore (bbox GetClosedSubterm);
  drawarrow (0.5[llcorner AppendFunc, lrcorner AppendFunc])--
    (0.5[ulcorner GetArguments, urcorner GetArguments]) cutafter (bbox
      GetArguments) cutbefore (bbox AppendFunc);
  drawarrow (0.5[lrcorner GetArguments, urcorner GetArguments]) --
    (0.5[lrcorner TermSubexpression, urcorner TermSubexpression])
    cutafter (bbox TermSubexpression)
    cutbefore (bbox GetArguments);

  z4 = ((1/3)[llcorner TermSubexpression, lrcorner TermSubexpression]);
  z5 = ((2/3)[llcorner TermSubexpression, lrcorner TermSubexpression]);
  drawarrow (z4 -- (z4 + (0,-3u))) cutbefore (bbox TermSubexpression)
    cutafter (bbox GetClosedSubterm);
  drawarrow ((z5 + (0,-3u)) -- z5) cutafter (bbox TermSubexpression)
    cutbefore (bbox GetClosedSubterm);

  z6 = 0.5[ulcorner TermSubexpression, urcorner TermSubexpression];
  z7 = 0.5[lrcorner AppendFunc, urcorner AppendFunc];
  drawarrow z6--z7 cutbefore (bbox TermSubexpression)
    cutafter (bbox AppendFunc);
endfig;
end;