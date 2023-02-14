function [Data] = setMinMax(Data)

minval = 0.2; 
maxval = 0.8;
 
for k = 1:Data.Count
  v = Data.Value{k};
  if v > maxval
    Data.Value{k} = maxval;
  elseif v < minval
    Data.Value{k} = minval;
  end
end
end