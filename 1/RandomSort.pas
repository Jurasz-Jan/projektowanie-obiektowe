program RandomSort;
uses crt;

var
  numbers: array[1..50] of integer;
  i: integer;

//  (3.0)
procedure GenerateRandomNumbers;
var
  j: integer;
begin
  Randomize; 
  for j := 1 to 50 do
    numbers[j] := Random(101); 
end;

//  (3.5)
procedure BubbleSort;
var
  j, temp: integer;
  swapped: boolean;
begin
  repeat
    swapped := false;
    for j := 1 to 49 do
    begin
      if numbers[j] > numbers[j + 1] then
      begin
        temp := numbers[j];
        numbers[j] := numbers[j + 1];
        numbers[j + 1] := temp;
        swapped := true;
      end;
    end;
  until not swapped;
end;

begin
  
  GenerateRandomNumbers;
  
  
  writeln('Nieposortowana lista:');
  for i := 1 to 50 do
  begin
    write(numbers[i], ' ');
    if i mod 10 = 0 then writeln; 
  end;
  writeln;
  
 
  BubbleSort;
  

  writeln('Posortowana lista:');
  for i := 1 to 50 do
  begin
    write(numbers[i], ' ');
    if i mod 10 = 0 then writeln; 
  end;
  
  readln; 
end.