module sort(
	unsortID_0, unsortID_1, unsortID_2, unsortID_3, unsortID_4, unsortID_5,
	unsortgm_0, unsortgm_1, unsortgm_2, unsortgm_3, unsortgm_4, unsortgm_5,
	mode,
	sort_0, sort_1, sort_2, sort_3, sort_4, sort_5
	);

input [3:0] unsortID_0, unsortID_1, unsortID_2, unsortID_3, unsortID_4, unsortID_5;
input [3:0] unsortgm_0, unsortgm_1, unsortgm_2, unsortgm_3, unsortgm_4, unsortgm_5;
input mode;
output reg [3:0] sort_0, sort_1, sort_2, sort_3, sort_4, sort_5;
	
	reg [3:0] layer1_0, layer1_1, layer1_2, layer1_3, layer1_4, layer1_5;
	reg [3:0] layer2_1, layer2_2, layer2_3, layer2_4;
	reg [3:0] layer3_0, layer3_2, layer3_3, layer3_5;
	reg [3:0] layer4_0, layer4_1, layer4_2, layer4_3, layer4_4, layer4_5;

	// layer 1
	always@(*)begin
		if(mode)begin
			if (unsortID_0 >= unsortID_5)begin
				layer1_0 = unsortID_0;
				layer1_5 = unsortID_5;
			end
			else begin
				layer1_0 = unsortID_5;
				layer1_5 = unsortID_0;
			end
			if (unsortID_1 >= unsortID_3)begin
				layer1_1 = unsortID_1;
				layer1_3 = unsortID_3;
			end
			else begin
				layer1_1 = unsortID_3;
				layer1_3 = unsortID_1;
			end
			if (unsortID_2 >= unsortID_4)begin
				layer1_2 = unsortID_2;
				layer1_4 = unsortID_4;
			end
			else begin
				layer1_2 = unsortID_4;
				layer1_4 = unsortID_2;
			end
		end
		else begin
			if (unsortgm_0 >= unsortgm_5)begin
				layer1_0 = unsortgm_0;
				layer1_5 = unsortgm_5;
			end
			else begin
				layer1_0 = unsortgm_5;
				layer1_5 = unsortgm_0;
			end
			if (unsortgm_1 >= unsortgm_3)begin
				layer1_1 = unsortgm_1;
				layer1_3 = unsortgm_3;
			end
			else begin
				layer1_1 = unsortgm_3;
				layer1_3 = unsortgm_1;
			end
			if (unsortgm_2 >= unsortgm_4)begin
				layer1_2 = unsortgm_2;
				layer1_4 = unsortgm_4;
			end
			else begin
				layer1_2 = unsortgm_4;
				layer1_4 = unsortgm_2;
			end
		end
	end

	// layer 2
	always@(*)begin
		if (layer1_1 >= layer1_2)begin
			layer2_1 = layer1_1;
			layer2_2 = layer1_2;
		end
		else begin
			layer2_1 = layer1_2;
			layer2_2 = layer1_1;
		end
		if (layer1_3 >= layer1_4)begin
			layer2_3 = layer1_3;
			layer2_4 = layer1_4;
		end
		else begin
			layer2_3 = layer1_4;
			layer2_4 = layer1_3;
		end
	end

	// layer 3
	always@(*)begin
		if (layer1_0 >= layer2_3)begin
			layer3_0 = layer1_0;
			layer3_3 = layer2_3;
		end
		else begin
			layer3_0 = layer2_3;
			layer3_3 = layer1_0;
		end
		if (layer2_2 >= layer1_5)begin
			layer3_2 = layer2_2;
			layer3_5 = layer1_5;
		end
		else begin
			layer3_2 = layer1_5;
			layer3_5 = layer2_2;
		end
	end

	// layer 4
	always@(*)begin
		if (layer3_0 >= layer2_1)begin
			layer4_0 = layer3_0;
			layer4_1 = layer2_1;
		end
		else begin
			layer4_0 = layer2_1;
			layer4_1 = layer3_0;
		end
		if (layer3_2 >= layer3_3)begin
			layer4_2 = layer3_2;
			layer4_3 = layer3_3;
		end
		else begin
			layer4_2 = layer3_3;
			layer4_3 = layer3_2;
		end
		if (layer2_4 >= layer3_5)begin
			layer4_4 = layer2_4;
			layer4_5 = layer3_5;
		end
		else begin
			layer4_4 = layer3_5;
			layer4_5 = layer2_4;
		end
	end

	// layer 5
	always@(*)begin
		sort_0 = layer4_0;
		if (layer4_1 >= layer4_2)begin
			sort_1 = layer4_1;
			sort_2 = layer4_2;
		end
		else begin
			sort_1 = layer4_2;
			sort_2 = layer4_1;
		end
		if (layer4_3 >= layer4_4)begin
			sort_3 = layer4_3;
			sort_4 = layer4_4;
		end
		else begin
			sort_3 = layer4_4;
			sort_4 = layer4_3;
		end
		sort_5 = layer4_5;
	end

endmodule