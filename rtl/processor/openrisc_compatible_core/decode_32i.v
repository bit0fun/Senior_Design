module decode_32i(
	input[31:0] 	inst_in;				//Input data for instruction
	input 			clk_in;					//Input clock for pipelining
	input			reset_in;				//Reset line; clears registers

	output[4:0] reg	reg_a_addr_out;			//Output register operand A address
	output[4:0] reg reg_b_addr_out;			//Output register operand B address
	output[4:0] reg reg_d_addr_out;			//Destination register adress

	output 		reg	flag_ill_inst_out;		//Flag for illegal instruction exception
	output		reg flag_syscall_out;		//Flag for system call instruction exception
	output		reg flag_trap_out;			//Flag for trap exception

	/*Control lines*/
	output 		reg ctl_alu_sub_out;		//Tell ALU to do subtraction instead of addition
	output		reg ctl_alu_en_carry_out;	//Tell ALU to enable carry
	output 		reg ctl_mtspr_out;			//If needed to access special purpose registers
	output		reg ctl_ldstr_zero_ext;		//Zero extend for load/store
	output		reg ctl_ldstr_size;			//Size of load/store value
	output		reg ctl_set_flg_inst;		//Set flag instruction value
	output		reg ctl_

	);


	/*Wire declarations*/
	wire[5:0]	opcode_w;					//Wire for opcode
	wire[3:0]	opcode_alu_w;				//Wire for ALU opcode
	wire[15:0]	immediate_w;				//Immediate value
	wire[7:0]	opcode_fpu;					//Opcode for FPU
	wire[1:0]	opcode_ldst;				//Opcode for Load/Store inst
	wire[4:0]	reg_a_addr_w;
	wire[4:0]	reg_b_addr_w;
	wire[4:0] 	reg_d_addr_w;

	wire

	/*Assignments*/
	
	assign opcode_w = inst_in[31:26];		//Opcode, bits 31 to 26
	//assign opcode_fpu = ;
	assign immediate_w = inst_in[15:0]; 	//Wire for immediate value
	assign  




	always@(posedge clk) begin

	end


	endmodule;
