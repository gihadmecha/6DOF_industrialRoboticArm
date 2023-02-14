function [Data,indices] = setMinMax(Data)

minval = 0.2; 
maxval = 0.8;
indices = [];
 
for k = 1:Data.Count
  v = Data.Value{k};
  if v > maxval
    Data.Value{k} = maxval;
    indices = [indices k];
  elseif v < minval
    Data.Value{k} = minval;
    indices = [indices k];
  end  
end
end