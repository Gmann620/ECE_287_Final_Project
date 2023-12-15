	audio_core u0 (
		.clk         (<connected-to-clk>),         //                clk.clk
		.reset       (<connected-to-reset>),       //              reset.reset
		.address     (<connected-to-address>),     // avalon_audio_slave.address
		.chipselect  (<connected-to-chipselect>),  //                   .chipselect
		.read        (<connected-to-read>),        //                   .read
		.write       (<connected-to-write>),       //                   .write
		.writedata   (<connected-to-writedata>),   //                   .writedata
		.readdata    (<connected-to-readdata>),    //                   .readdata
		.irq         (<connected-to-irq>),         //          interrupt.irq
		.AUD_ADCDAT  (<connected-to-AUD_ADCDAT>),  // external_interface.ADCDAT
		.AUD_ADCLRCK (<connected-to-AUD_ADCLRCK>), //                   .ADCLRCK
		.AUD_BCLK    (<connected-to-AUD_BCLK>)     //                   .BCLK
	);

