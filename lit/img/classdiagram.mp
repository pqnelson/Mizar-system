input metauml;

%outputtemplate := "termclassUML.eps";

beginfig(0) % class diagram for AST for terms
  metauml_defaultFontOblique  := "cmti8";
  AbstractClass.TermExpression("TermExpression")()(); % [12]
  TermExpression.n = (0,0);
  TermExpression.info.foreColor := (.9, .9, 0);
  % Subclasses of TermExpression
  Class.OneArgumentTerm("OneArgumentTerm")()(); % 12 % [2]
  Class.SimpleTerm("SimpleTerm")()(); % 1
  Class.PlaceholderTerm("PlaceholderTerm")()(); % 2
  Class.SimpleFraenkelTerm("SimpleFraenkelTerm")()(); % 3 % [1]
  Class.NumeralTerm("NumeralTerm")()(); % 4
  Class.InfixTerm("InfixTerm")()(); % 5
  Class.TermWithArguments("TermWithArguments")()(); % 6 % [3]
  Class.ChoiceTerm("ChoiceTerm")()(); % 7
  Class.InternalForgetfulTerm("InternalForgetfulTerm")()(); % 8
  Class.ExactlyTerm("ExactlyTerm")()(); % 9 % [1]
  Class.ItTerm("ItTerm")()(); % 10
  Class.IncorrectTerm("IncorrectTerm")()(); % 11
  IncorrectTerm.se = TermExpression.n + (-10,20);  % 11
  SimpleTerm.sw = TermExpression.n + (10,20);      %  1
  OneArgumentTerm.s = IncorrectTerm.ne + (10,20);  % 12
  PlaceholderTerm.nw = SimpleTerm.se + (20,10);    %  2
  SimpleFraenkelTerm.w = TermExpression.e + (40,0);%  3
  NumeralTerm.w = TermExpression.e + (20*sqrt(2),-20*sqrt(2)); % 4
  InfixTerm.nw = TermExpression.s + (10,-20);       %  5
  TermWithArguments.n = InfixTerm.sw + (-10,-20);   %  6
  ChoiceTerm.ne = TermExpression.s + (-10,-20);     %  7
  InternalForgetfulTerm.se = ChoiceTerm.nw + (-20*sqrt(2),-20*sqrt(2)); % 8
  ExactlyTerm.e = TermExpression.w + (-30,0);      %  9
  ItTerm.e = IncorrectTerm.sw + (-10*sqrt(2), 10*sqrt(2));             % 10

  drawObjects(TermExpression,IncorrectTerm,SimpleTerm,OneArgumentTerm,PlaceholderTerm,SimpleFraenkelTerm,NumeralTerm,InfixTerm,TermWithArguments,ChoiceTerm,InternalForgetfulTerm,ExactlyTerm,ItTerm);

  link(inheritance)(ItTerm.se -- TermExpression.nw);
  link(inheritance)(ExactlyTerm.e -- TermExpression.w);
  link(inheritance)(InternalForgetfulTerm.ne -- TermExpression.sw);
  link(inheritance)(ChoiceTerm.n -- 0.5[TermExpression.sw,TermExpression.s]);
  link(inheritance)(TermWithArguments.n -- TermExpression.s);
  link(inheritance)(InfixTerm.n -- 0.5[TermExpression.se,TermExpression.s]);
  link(inheritance)(SimpleFraenkelTerm.w -- TermExpression.e);
  link(inheritance)(NumeralTerm.nw -- TermExpression.se);
  link(inheritance)(PlaceholderTerm.sw -- TermExpression.ne);
  link(inheritance)(SimpleTerm.s -- 0.5[TermExpression.n,TermExpression.ne]);
  link(inheritance)(IncorrectTerm.s -- 0.5[TermExpression.n,TermExpression.nw]);
  link(inheritance)(OneArgumentTerm.s -- TermExpression.n);
  % One Argument Term subclasses (noon)
  Class.SelectorTerm("SelectorTerm")()();
  SelectorTerm.e = (-30,0) + OneArgumentTerm.w;
  Class.ForgetfulTerm("ForgetfulTerm")()();
  ForgetfulTerm.w = (30,0) + OneArgumentTerm.e;
  drawObjects(SelectorTerm,ForgetfulTerm);
  link(inheritance)(SelectorTerm.e -- OneArgumentTerm.w);
  link(inheritance)(ForgetfulTerm.w -- OneArgumentTerm.e);
  % subclasses of SimpleFrankelTerm
  Class.FraenkelTerm("FraenkelTerm")()();
  FraenkelTerm.n = (20,-40) + SimpleFraenkelTerm.s;
  drawObject(FraenkelTerm);
  link(inheritance)(FraenkelTerm.n -- (SimpleFraenkelTerm.s + (20,0)));
  % Term with arguments subclasses (6 o'clock)
  Class.CircumfixTerm("CircumfixTerm")()();
  CircumfixTerm.n = (0,-20) + TermWithArguments.s;
  Class.PrivateFunctorTerm("PrivateFunctorTerm")()();
  PrivateFunctorTerm.e = (-20,0) + CircumfixTerm.w;
  Class.AggregateTerm("AggregateTerm")()();
  AggregateTerm.w = (20,0) + CircumfixTerm.e;
  drawObjects(CircumfixTerm,PrivateFunctorTerm,AggregateTerm);
  link(inheritance)(CircumfixTerm.n -- TermWithArguments.s);
  link(inheritance)(PrivateFunctorTerm.ne -- TermWithArguments.sw);
  link(inheritance)(AggregateTerm.nw -- TermWithArguments.se);
  % subclasses of ExactlyTerm
  Class.QualifiedTerm("QualifiedTerm")()();
  QualifiedTerm.e = ExactlyTerm.w + (-20, 0);
  drawObject(QualifiedTerm);
  link(inheritance)(QualifiedTerm.e -- ExactlyTerm.w);
endfig;

Class.MObject("MObject")()();
Class.StackedObj("StackedObj")("+ Previous : ^StackedObj")();
Class.ItemObj("ItemObj")("+ Previous : ^StackedObj", "+ nItemKind : ItemKind")();

beginfig(1)
  % Class.MObject("MObject")()();
  % Class.StackedObj("StackedObj")("+ Previous : StackedObj")();
  StackedObj.w = MObject.e + (30,0);
  ItemObj.w = StackedObj.e + (30,0);
  drawObjects(MObject, StackedObj, ItemObj);
  link(inheritance)(StackedObj.w -- MObject.e);
  link(inheritance)(ItemObj.w -- StackedObj.e);
endfig;

Class.BlockObj("BlockObj")("+ Previous : ^StackedObj", "+ nBlockKind : BlockKind")();

beginfig(2)
  StackedObj.w = MObject.e + (30,0);
  BlockObj.w = StackedObj.e + (30,0);
  drawObjects(MObject, StackedObj, BlockObj);
  link(inheritance)(StackedObj.w -- MObject.e);
  link(inheritance)(BlockObj.w -- StackedObj.e);
endfig;

Class.wsBlock("wsBlock")("+ nBlockKind : BlockKind", "+ nItems : wsItem[0..*]",
    "+ nBlockPos : Position", "+ nBlockEndPos : Position")();
Class.wsTextProper("wsTextProper")("+ nArticleId : string",
    "+ nArticleExt : string")("+ NewBlock(BlockKind,Position) : ^wsBlock",
    "+ NewItem(ItemKind,Position) : ^wsItem");
Class.wsItem("wsItem")("+ nItemKind : ItemKind", "+ nContent : ^MObject", "+ nBlock : ^wsBlock")();
beginfig(3)
  wsBlock.w = MObject.e + (30,0);
  wsTextProper.w = wsBlock.e + (30,0);
  wsItem.n = wsBlock.s + (0, -30);
  drawObjects(MObject,wsBlock,wsTextProper,wsItem);
  link(inheritance)(wsBlock.w -- MObject.e);
  link(inheritance)(wsTextProper.w -- wsBlock.e);
  link(composition)(wsItem.n -- wsBlock.s);
endfig;

Class.extBlock("extBlock")("+ nLastWSItem : ^wsItem",
    "+ nLastWSBlock : ^wsBlock",
    "+ nLinked : Boolean",
    "+ nLinkAllowed : Boolean",
    "+ nLinkProhibited : Boolean",
    "+ nLinkPos : Position",
    "+ nInDiffuse : Boolean",
    "+ nLastSentence : ^Formula",
    "+ nHasAssumptions : Boolean")();

beginfig(4)
  StackedObj.w = MObject.e + (30,0);
  BlockObj.w = StackedObj.e + (30,0);
  extBlock.w = BlockObj.e + (30,0);
  drawObjects(MObject, StackedObj, BlockObj, extBlock);
  link(inheritance)(StackedObj.w -- MObject.e);
  link(inheritance)(BlockObj.w -- StackedObj.e);
  link(inheritance)(extBlock.w -- BlockObj.e);
endfig;


Class.extItem("extItem")("+ nItemPos : Position",
    "+ nLastWSItem : ^wsItem",
    "+ nLabelIdNr : integer",
    "+ nLabelIdPos : Position",
    "+ nLabel : ^Label",
    "+ nPropPos : Position",
    "+ nInference : ^Justification",
    "+ nLinkable : Boolean",
    "+ nRegularStatementKind : RegularStatementKind",
    "+ nItAllowed : Boolean")();

beginfig(5)
  %StackedObj.w = MObject.e + (30,0);
  ItemObj.w = StackedObj.e + (30,0);
  extItem.w = ItemObj.e + (30,0);
  drawObjects(StackedObj, ItemObj, extItem);
  %link(inheritance)(StackedObj.w -- MObject.e);
  link(inheritance)(ItemObj.w -- StackedObj.e);
  link(inheritance)(extItem.w -- ItemObj.e);
endfig;

%outputtemplate := "%j%c.eps";
end;