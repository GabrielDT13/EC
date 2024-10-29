# Definición del segmento de datos
			.data 0x10010000
addr0: 		.byte 0x40,0x41
addr1: 		.byte 0x42,0x43,0x44,0x45
			.space 2
			
data1: 		.word 0x53529150
data2: 		.byte 0x84

			.align 1
data3: 		.half 0x3322, 0x5544

			.align 2
data4: 		.word 0x44332211
