
module ALU (a,b,ctrl_op,ctrl_in,out_signal,carry_bit);
  input [7:0]a,b;
  input [2:0]ctrl_op;
  input ctrl_in;
  output wire [7:0]out_signal;
  output wire carry_bit;
  reg [8:0]result;
  assign out_signal=result[7:0];
  assign carry_bit=(ctrl_op==000)?result[8]:1'b0;
  always@(ctrl_op or ctrl_in or a or b)
  begin
    case (ctrl_op)
      3'b000 : result=a+b;
      3'b001 : result=a-b;
      3'b010 : result=a&b;
      3'b011 : result=a|b;
      3'b100 : 
      begin
       if (ctrl_in== 0)result={a[7:0],a[7]};
       else result={b[7:0],b[7]};
      end
      3'b101 : 
      begin
        if (ctrl_in==0)result={1'b0,a[0],a[7:1]};
        else result={1'b0,b[0],b[7:1]};
      end
      3'b110 :
      begin
        if (ctrl_in==0)result={a[7:0],1'b0};
        else result={b[7:0],1'b0};
      end
      3'b111 :
      begin
        if (ctrl_in==0)result={1'b0,1'b0,a[7:1]};
        else result={1'b0,1'b0,b[7:1]};
      end
    endcase
  end
endmodule

