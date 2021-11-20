// https://esrd2014.blogspot.com/p/register-file.html

module register_file( WD3, AW, RD1, AR_1, RD2, AR_2, RD, WR, rst, EN, clk );

	// Entradas

    // WD3: 32-bits: Puerto de entrada de datos, donde se coloca el valor
    // a escribir en los registros internos.
	input  [31:0]  WD3;


    // AR_1: 5-bits: Dirección de lectura para el puerto RD1. Dependiendo del
    // valor en este puerto, es el registro interno que se entrega por la señal
    // RD1.
    // AR_2: 5-bits: Dirección de lectura para el puerto RD2. Dependiendo del
    // valor en este puerto, es el registro interno que se entrega por la señal
    // RD1.
    // AW: 5bits: Dirección de escritura a los registros. Dependiendo del valor
    // en este puerto, es al registro que se escribirá con el valor en WD3
    input  [4:0]  AW, AR_1, AR_2;


    // WR 1-bit: Cuando esta señal es igual a 1 lógico habilita la escritura al
    // registro direccionado por la dirección AW.
	input   WR;

    // WR 1-bit: Cuando esta señal es igual a 1 lógico habilita la lectura al
    // registro direccionado por las direcciones AR_1 , AR_2.
	input  RD;

    // Salidas

    // RD1: 32-bits: Puerto de salida en donde se entrega el dato almacenado en
    // el registro direccionado por A1.
    // RD2: 32-bits: Puerto de salida en donde se entrega el dato almacenado en
    // el registro direccionado por A2.
    output  [31:0]  RD1,RD2;
    reg     [31:0]  RD1,RD2;

    // Memory array
	 //(* ramstyle = "M9K" *)  reg 		[31:0]  regFile [0:31] ;
	 reg 		[31:0]  regFile [0:31] /* synthesis ramstyle = "no_rw_check, M10K" */;

    // General enable, clock and reset
    input   EN,clk,rst;


    integer i;

	always @ (posedge clk || rst)
		begin
		if (EN == 1)
			begin
				if (rst == 1) //If reset
					begin
					for (i = 0; i < 32; i = i + 1)
					begin
						regFile [i] = 32'h0;
					end
                RD1 = 32'hx;
           end
      else if (rst == 0) //If not at reset
        begin
		    case ({RD,WR})
                2'b00:  begin
                 end
                2'b01:  begin //If Write only
                     regFile [AW] = WD3;
                end
                2'b10:  begin //If Read only
                     RD1 = regFile [AR_1];
                     RD2 = regFile [AR_2];
                end
                2'b11:  begin //If both active
                     RD1 = regFile [AR_1];
                     RD2 = regFile [AR_2];
                     regFile [AW] = WD3;
                end
                default: begin //If undefined
                end
           endcase
        end
        else;
        end
        else;
        end
    endmodule

