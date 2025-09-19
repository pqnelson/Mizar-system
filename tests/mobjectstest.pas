unit MObjectsTest;

interface

uses fpcunit,testregistry,mobjects;

type
   TMObjectsTests = class(TTestCase)
      Published
         procedure MSortedExtListFindTest;
         procedure MSortedCollectionFindTest1;
         procedure MSortedCollectionFindTest2;
         procedure MSortedCollectionIndexOfMissingTest;
         procedure MSortedCollectionIndexOfPresentTest1;
         procedure MSortedCollectionIndexOfPresentTest2;
         procedure MStringListFindWithDuplicatesTest;
         procedure MStringListIndexOfWithDuplicatesTest;
         procedure IntPairSeqMemoryLeakTest;
   end;
   
implementation

function compareMStr(l, r: Pointer): integer;
var c: integer;
lhs,rhs: PStr;
begin
   lhs := PStr(l);
   rhs := PStr(r);
   if lhs=rhs then c := 0
   else if Assigned(lhs) and not Assigned(rhs) then c:=1
   else if not Assigned(lhs) and Assigned(rhs) then c:=-1
   else begin
      c := CompareStr(lhs^.fStr, rhs^.fStr);
      if c > 0 then c := 1
      else if c < 0 then c := -1;
   end;
   compareMStr:=c;
end;

procedure TMObjectsTests.MSortedExtListFindTest;
var
   entry, needle: PStr;
   key: Pointer;
   list: PSortedExtList;
   actual, expected: integer;
   isFound, expectedFound: Boolean;
begin
   list := New(PSortedExtList, InitSorted(5, compareMStr)); {leaked}
   entry := New(PStr, Init('a'));
   list.insert(entry);
   entry := New(PStr, Init('b'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insert(entry);
   entry := New(PStr, Init('d'));
   list.insert(entry);
   needle := New(PStr, Init('c'));
   key := needle;
   isFound:=list.find(key,actual);
   expected:=2;
   expectedFound:=true;
   AssertEquals('The first entry is not assigned',expected,actual);
   AssertEquals('The entry is not found',expectedFound,isFound);
   {cleanup}
   list.FreeItemsFrom(0);
   Dispose(PObject(key),Done);
   Dispose(list, Done);
end;

{with duplicates}
procedure TMObjectsTests.MSortedCollectionFindTest1;
var
   entry, needle: PStr;
   key: Pointer;
   list: PSortedCollection;
   actual, expected: integer;
   isFound, expectedFound: Boolean;
begin
   list := New(PSortedCollection, InitSorted(5,5, compareMStr)); {leaked}
   list.duplicates := true;
   entry := New(PStr, Init('a'));
   list.insert(entry);
   entry := New(PStr, Init('b'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insert(entry);
   entry := New(PStr, Init('d'));
   list.insert(entry);
   needle := New(PStr, Init('c'));
   key := needle;
   isFound:=list.search(key,actual);
   expected:=2;
   expectedFound:=true;
   AssertEquals('The first entry is not assigned',expected,actual);
   AssertEquals('The entry is not found',expectedFound,isFound);
   {cleanup}
   list.FreeItemsFrom(0);
   Dispose(PObject(key),Done);
   Dispose(list, Done);
end;

{without duplicates}
procedure TMObjectsTests.MSortedCollectionFindTest2;
var
   entry, needle: PStr;
   key: Pointer;
   list: PSortedCollection;
   actual, expected: integer;
   isFound, expectedFound: Boolean;
begin
   list := New(PSortedCollection, InitSorted(5,5, compareMStr));
   entry := New(PStr, Init('a'));
   list.insert(entry);
   entry := New(PStr, Init('b'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insertD(entry);
   entry := New(PStr, Init('d'));
   list.insert(entry);
   needle := New(PStr, Init('c'));
   key := needle;
   isFound:=list.search(key,actual);
   expected:=2;
   expectedFound:=true;
   AssertEquals('The first entry is not assigned',expected,actual);
   AssertEquals('The entry is not found',expectedFound,isFound);
   {cleanup}
   list.FreeItemsFrom(0);
   Dispose(PObject(key),Done);
   Dispose(list, Done);
end;


procedure TMObjectsTests.MSortedCollectionIndexOfMissingTest;
var
   entry, needle: PStr;
   key: Pointer;
   list: PSortedCollection;
   actual, expected: integer;
begin
   list := New(PSortedCollection, InitSorted(5,5, compareMStr));
   entry := New(PStr, Init('a'));
   list.insert(entry);
   entry := New(PStr, Init('b'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insertD(entry);
   entry := New(PStr, Init('d'));
   list.insert(entry);
   needle := New(PStr, Init('z'));
   key := needle;
   actual := list.IndexOf(key);
   expected:=-1;
   AssertEquals('The index for the missing entry',expected,actual);
   {cleanup}
   list.FreeItemsFrom(0);
   Dispose(PObject(key),Done);
   Dispose(list, Done);
end;

procedure TMObjectsTests.MSortedCollectionIndexOfPresentTest1;
var
   entry, needle: PStr;
   key: Pointer;
   list: PSortedCollection;
   actual, expected: integer;
begin
   list := New(PSortedCollection, InitSorted(5,5, compareMStr));
   list.duplicates := True;
   entry := New(PStr, Init('a'));
   list.insert(entry);
   entry := New(PStr, Init('b'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insert(entry);
   entry := New(PStr, Init('d'));
   list.insert(entry);
   needle := New(PStr, Init('c'));
   key := needle;
   actual := list.IndexOf(key);
   expected:=3;
   AssertEquals('The rightmost index for entry in MSortedCollection with duplicates',expected,actual);
   {cleanup}
   list.FreeItemsFrom(0);
   Dispose(PObject(key),Done);
   Dispose(list, Done);
end;

procedure TMObjectsTests.MSortedCollectionIndexOfPresentTest2;
var
   entry, needle: PStr;
   key: Pointer;
   list: PSortedCollection;
   actual, expected: integer;
begin
   list := New(PSortedCollection, InitSorted(5,5, compareMStr));
   entry := New(PStr, Init('a'));
   list.insert(entry);
   entry := New(PStr, Init('b'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insert(entry);
   entry := New(PStr, Init('c'));
   list.insertD(entry);
   entry := New(PStr, Init('d'));
   list.insert(entry);
   needle := New(PStr, Init('c'));
   key := needle;
   actual := list.IndexOf(key);
   expected:=2;
   AssertEquals('The rightmost index for entry in MSortedCollection without duplicates',expected,actual);
   {cleanup}
   list.FreeItemsFrom(0);
   Dispose(PObject(key),Done);
   Dispose(list, Done);
end;

procedure TMObjectsTests.MStringListFindWithDuplicatesTest;
var
   list: PStringList;
   actual, expected: integer;
begin
   {setup}
   list := New(PStringList, Init(10)); {leaked?}
   list.fDuplicate:=dupAccept;
   list.AddString('a');
   list.AddString('b');
   expected:=list.AddString('c'); {expected assigned here}
   list.AddString('c');
   list.AddString('c');
   list.AddString('d');
   list.SetSorted(true);
   {test}
   list.Find('c', actual);
   AssertEquals('The rightmost index for entry in sorted MStringList with duplicates',expected,actual);
   {cleanup}
   Dispose(list, Done);
end;

procedure TMObjectsTests.MStringListIndexOfWithDuplicatesTest;
var
   list: PStringList;
   actual, expected: integer;
begin
   {setup}
   list := New(PStringList, Init(10)); {leaked}
   list.fDuplicate:=dupAccept;
   list.AddString('a');
   list.AddString('b');
   expected:=list.AddString('c'); {expected assigned here}
   list.AddString('c');
   list.AddString('c');
   list.AddString('d');
   list.SetSorted(true);
   {test}
   actual:=list.IndexOf('c');
   AssertEquals('The rightmost index for entry in sorted MStringList with duplicates',expected,actual);
   {cleanup}
   Dispose(list, Done);
end;


procedure TMObjectsTests.IntPairSeqMemoryLeakTest;
var
   list: IntPairSeqPtr;
   item: IntPair;
   items: IntPairListPtr;
   actual, expected: Boolean;
   x, y: integer;
begin
   {setup}
   list := New(IntPairSeqPtr, Init(10));
   x:=3; y:=5;
   list.AssignPair(x, y);
   x:=51; y:=17;
   list.AssignPair(x, y);
   x:=17; y:=3;
   list.AssignPair(x, y);
   items := list.Items;
   {test}
   Dispose(list, Done); {leaked?}
   expected:=true;
   actual:=Assigned(items);
   AssertEquals('Memory leak example',expected,actual);
   {cleanup}
end;


initialization
   RegisterTest(TMObjectsTests);
   
end.