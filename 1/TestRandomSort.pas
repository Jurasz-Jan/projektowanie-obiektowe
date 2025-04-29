program RandomSort;
uses crt;

var
  numbers: array[1..50] of integer;
  i: integer;


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

//to continue
