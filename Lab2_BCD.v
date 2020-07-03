module BCD (D,CLK,Clr,En,Ld,Up,Q,Co);

input [3:0] D;
input CLK;
input Clr,En,Ld,Up;
output reg [3:0] Q;
output reg Co;

initial 
begin 
Co<=0;
end

always @(posedge CLK)
begin
if(~Clr)
begin
Q <= 4'b0000;
end
else if(En)
begin
	if(Ld)
	begin
	Q <= D;
	end
	else
	begin 
		if(Up)
		begin
			if(Co)
			begin
			Q<=4'b0000;
			end
			else
			Q<=Q+1;
		end
		else 
		begin 
			if(Co)
			begin
			Q<=4'b1001;
			end
			else
			Q<=Q-1;
		end
	end
end
end


always @(*)
begin 
if(~Clr)
begin
Co<=0;
end
	else if(~En)
	begin
	Co<=0;
	end
	else if(En)
	begin
	case(Up)
		1 : begin 
		if(Q == 4'b1001)
		begin
		Co <= 1;
		end
		else
		begin 
		Co <= 0;
		end
		    end 
		0 : begin 
		if(Q==4'b0000)
		begin
		Co <=1;
		end
		else
		begin
		Co <= 0;
		end
		    end
	endcase
	end
end
endmodule
