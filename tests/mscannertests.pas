unit MScannerTests;

interface

uses fpcunit,testregistry,mscanner;

type
   MScannerTests = class(TTestCase)
      Published
      procedure MySillyTest;
      procedure EmptyArticleTest;
   end;
   
implementation

procedure MScannerTests.MySillyTest;
begin
   AssertEquals('The compiler cannot count !',2,1+1);
end;

procedure MScannerTests.EmptyArticleTest;
begin
   {setup}
   InitSourceFile('../tests/resources/test_1.miz', '../tests/resources/test_1'); {leaked}
   {test}
   ReadToken;
   AssertEquals('CurWord.Kind should be sy_environ',TokenName[sy_environ],TokenName[CurWord.Kind]);
   ReadToken;
   AssertEquals('CurWord.Kind should be sy_Begin',TokenName[sy_Begin],TokenName[CurWord.Kind]);
   {teardown}
   gScanner.fTokens.done;
   CloseSourceFile;
end;

initialization
   RegisterTest(MScannerTests);
   
end.