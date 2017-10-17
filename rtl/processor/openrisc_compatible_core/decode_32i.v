module decode_32i(
	input[31:0] 	inst_in;			//Input data for instruction
	input 			clk_in;				//Input clock for pipelining
	input			reset_in;			//Reset line; clears registers

	output[4:0] reg	reg_a_addr_out;		//Output register operand A address
	output[4:0] reg reg_b_addr_out;		//Output register operand B address
	output[4:0] reg reg_d_addr_out;		//Destination register adress

	output 		reg	flag_ill_inst_out;	//Flag for illegal instruction exception
	output		reg flag_syscall_out;	//Flag for system call instruction exception


	);


	/*Wire declarations*/
	wire[5:0]	opcode_w;				//Wire for opcode
	wire[3:0]	opcode_alu_w;			//Wire for ALU opcode
	wire[15:0]	immediate_w;			//Immediate value
	wire[7:0]	opcode_fpu;				//Opcode for FPU




	/*Assignments*/
	
	assign opcode_w = inst_in[31:26];	//Opcode, bits 31 to 26
