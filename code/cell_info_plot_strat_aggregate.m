function cell_info_plot_strat_aggregate(cell_info)

%cells = get_cell_info(cell_info, 20239); %'37');
cells = get_cell_info(cell_info, '37');
cells = cell_info;
filter_low_confidence = 0;
binsums = zeros(size(cell_info(1).strat_unrml(:,2)));
binsums = repelem({binsums},5);
for cell_info_elem = cells.'

	%strat = cell_info_elem.strat_nrml;
	strat = cell_info_elem.strat_unrml;
	index = cell_info_elem.class+1;
	binsums{index} = binsums{index} + strat(:,2);

	%{
	if cell_info_elem.class ~= 1   % not Ganglion cell
		continue;
	end
	%}
end

binsums = cell2mat(binsums);
binsums(:,6) = sum(binsums,2);

figure;
plot(cell_info(1).strat_unrml(:,1), binsums);