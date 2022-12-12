function impedances = load_egi_impedances(fullpath)

% Load impedances from egi raw file exports (.mff) folders.
% Impedances need to be separately saved in NetStation program during
% measurements.

  insides = parseXML([fullpath '/info1.xml']);
  istruct = insides.Children(6).Children(4).Children(8).Children;
  ind2channel = find(strcmp({istruct.Name}','ch'));
  istruct = {istruct.Children}';
  istruct = istruct(ind2channel);
  icell = cellfun(@(x) x.Data, istruct, 'UniformOutput', false);
  impedances = cellfun(@(x) str2num(x), icell);

end
