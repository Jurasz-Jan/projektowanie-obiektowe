program RandomSort;
uses crt;

var
  numbers: array[1..50] of integer;
  i: integer;

//  (4.0)
procedure GenerateRandomNumbers(from, to, count: integer);
var
  j: integer;
begin
  Randomize; 
  for j := 1 to count do
  begin
    numbers[j] := from + Random(to - from + 1);
  end;
end;
//  (3.5)
procedure BubbleSort(count: integer);
var
  j, temp: integer;
  swapped: boolean;
begin
  repeat
    swapped := false;
    for j := 1 to count - 1 do
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
  clrscr; 
  GenerateRandomNumbers(0, 100, 50);
  
  writeln('Nieposortowana lista:');
  for i := 1 to 50 do
  begin
    write(numbers[i], ' ');
    if i mod 10 = 0 then writeln; 
  end;
  writeln;
  
  BubbleSort(50);
  
  writeln('Posortowana lista:');
  for i := 1 to 50 do
  begin
    write(numbers[i], ' ');
    if i mod 10 = 0 then writeln; 
  end;
  
  readln; //trzeba nacisnąć Enter żeby wyjść
end.