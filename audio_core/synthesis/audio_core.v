// audio_core.v

// Generated using ACDS version 22.1 922

`timescale 1 ps / 1 ps
module audio_core (
		input  wire [1:0]  address,     // avalon_audio_slave.address
		input  wire        chipselect,  //                   .chipselect
		input  wire        read,        //                   .read
		input  wire        write,       //                   .write
		input  wire [31:0] writedata,   //                   .writedata
		output wire [31:0] readdata,    //                   .readdata
		input  wire        clk,         //                clk.clk
		input  wire        AUD_ADCDAT,  // external_interface.ADCDAT
		input  wire        AUD_ADCLRCK, //                   .ADCLRCK
		input  wire        AUD_BCLK,    //                   .BCLK
		output wire        irq,         //          interrupt.irq
		input  wire        reset        //              reset.reset
	);

	audio_core_audio_0 audio_0 (
		.clk         (clk),         //                clk.clk
		.reset       (reset),       //              reset.reset
		.address     (address),     // avalon_audio_slave.address
		.chipselect  (chipselect),  //                   .chipselect
		.read        (read),        //                   .read
		.write       (write),       //                   .write
		.writedata   (writedata),   //                   .writedata
		.readdata    (readdata),    //                   .readdata
		.irq         (irq),         //          interrupt.irq
		.AUD_ADCDAT  (AUD_ADCDAT),  // external_interface.export
		.AUD_ADCLRCK (AUD_ADCLRCK), //                   .export
		.AUD_BCLK    (AUD_BCLK)     //                   .export
	);

endmodule
