// =============================================================================
// Author  : Roy Ayalon
// =============================================================================
// Description:
// Register
//
// =============================================================================
// Design Parameters:
// NAME                         DESCRIPTION
// ----                         -----------
// - WIDTH                      Width of data path
// - [WIDTH-1:0] RESET_VAL      Reset value for data path
// 
// Inputs:
// - clk                        --> the clock that is used to evaluate the expression
// - rst_n                      --> the expression will not be evaluated if rst_n===1'b0
// - enable                     --> enable needs to be equal to 1 for the data to go to output
// - data_in                    --> the data we want to be input to the ff
// =============================================================================

//========
// Module
//========
module m_ff 
#(parameter                             WIDTH = 8,          //Width of data path
                                        RESET_VAL = 0       //Reset value for data path
)

(
input                           clk,
input                           rst_n,
input                           enable,
input       [WIDTH-1:0]         data_in ,
output reg  [WIDTH-1:0]         data_out
);




// synopsys translate_off
wire expr = ((enable === 1'bx) | (enable === 1'bz));
m_assert m_assert(
.clk(clk),
.rst_n(rst_n),
.expr(expr)
);

// synopsys translate_on

always @(posedge clk or negedge rst_n) 
if (~rst_n) data_out <= RESET_VAL;          //if rst_n = 0 => output = RESET_VAL
else if (enable) data_out <= data_in;       //transfer data

endmodule

