module BCD2 (D1,D2,CLK,Clr,En,Ld,Up,Q1,Q2,Co);

input [3:0] D1;
input [3:0] D2;
input CLK;
input Clr,En,Ld,Up;
output [3:0] Q1;
output [3:0] Q2;
output reg Co;
wire Co1;
wire Co2;
reg En3;
wire En2;
initial 
begin 
Co<=0;
En3<=1;
end


BCD B1 (D1,CLK,Clr,En,Ld,Up,Q1,Co1);
BCD B2 (D2,CLK,Clr,En2,Ld,Up,Q2,Co2);

always @(*)
begin 
if(Up)
begin
	if(Q1 != 4'b1001)
	begin 
	En3<=0;
	end
	else
	En3<=1;
end
else 
begin
	if(Q1 != 4'b0000)
	begin
	En3<=0;
	end
	else 
	En3<=1;
end

end

assign En2 = En3;
always @(*)
begin
if(Co1 | Co2)
begin
	case (Up)
	1: begin
	if(Q2 == 4'b1001)
	begin
		if(Q1 == 4'b1001)
		begin
		Co<= 1 ;
		end
	end
        end
	0: begin	
	if(Q2 == 4'b0000)
	begin
		if(Q1 == 4'b0000)
		begin
		Co <=1;
		end
	end
	end
	endcase
	
end 
else
Co<=0;
end

endmodule