set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { RX }]; #IO_L17P_T2_34 Sch=ja_p[1]
set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS33 } [get_ports { TX }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { EN_tri_o[0] }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { EN_tri_o[1] }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { EN_tri_o[2] }]; #IO_L17N_T2_34 Sch=ja_n[1]


set_property -dict { PACKAGE_PIN T9   IOSTANDARD LVCMOS33 } [get_ports { IIC_0_0_sda_io }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN U9   IOSTANDARD LVCMOS33 } [get_ports { IIC_0_0_scl_io }]; #IO_L17N_T2_34 Sch=ja_n[1]


set_property -dict { PACKAGE_PIN Y17   IOSTANDARD LVCMOS33 } [get_ports { BCK_ESP32 }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { LRCK_ESP32 }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { DATA_ESP32 }]; #IO_L17N_T2_34 Sch=ja_n[1]

set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports {  LED2_PLL_LK }]; #IO_L17N_T2_34 Sch=ja_n[1]

set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports {  BCK_ADAU }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports {  LRCK_ADAU  }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports {  DATA_ADAU  }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports {  CLK_O_ADAU}]; #IO_L17N_T2_34 Sch=ja_n[1]