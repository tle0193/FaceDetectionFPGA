transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_decoder/ii_address_calc/lpm_mult_unsign5bit_unsign9bit_to_unsign14bit.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_decoder/ii_address_calc/lpm_add_unsign14bit_to_unsign14bit.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_decoder/ii_address_mux.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_decoder/ii_address_calc/lpm_add_unsign17bit_to_unsign17bit.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_decoder/ii_address_calc/ii_address_calc.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_decoder/ii_address_decoder.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_decoder/rect_mux.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_decoder/lpm_add_unsign5bit_to_unsign5bit.vhd}

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_decoder/tb_ii_address_decoder.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_ii_address_decoder

add wave *
view structure
view signals
run 5 us