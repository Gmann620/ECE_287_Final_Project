
module audio_core (
	clk,
	reset,
	address,
	chipselect,
	read,
	write,
	writedata,
	readdata,
	irq,
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK);	

	input		clk;
	input		reset;
	input	[1:0]	address;
	input		chipselect;
	input		read;
	input		write;
	input	[31:0]	writedata;
	output	[31:0]	readdata;
	output		irq;
	input		AUD_ADCDAT;
	input		AUD_ADCLRCK;
	input		AUD_BCLK;
endmodule
