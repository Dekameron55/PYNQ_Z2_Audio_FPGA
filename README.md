
# PYNQ Z2 Audio Project with ESP32 Bluetooth Streaming

## Overview

This project enables audio streaming to the PYNQ Z2 board via Bluetooth using the ESP32. The ESP32 connects to the PYNQ Z2 board via the PMOD connector, and audio is sent through I2S to the ADAU1761 audio codec, which is onboard the PYNQ Z2. The Zynq SoC on the PYNQ Z2 facilitates communication between the ESP32 and the ADAU1761 via I2S, while the ADAU1761 is configured using I2C.

The ESP32 is initialized via a custom UART module written in Verilog, and the Bluetooth connection is managed using AT commands. The ADAU1761 codec is configured using the `periphery` library, which is already present in the PYNQ Linux image. This library allows direct access to I2C communication, enabling the necessary configuration of the audio codec before it starts receiving audio data from the ESP32.

Additionally, the ESP-AT firmware has been specifically recompiled to support A2DP (Advanced Audio Distribution Profile) and I2S audio stream. The AT UART module is configured not to use hardware flow control, ensuring smooth operation over the UART interface.

![Screenshot](https://github.com/Dekameron55/PYNQ_Z2_Audio_FPGA/blob/main/images/Setup.jpg)


## Hardware Requirements

- PYNQ Z2 Board
- ESP32 with PMOD connector
- ADAU1761 Audio Codec (onboard PYNQ Z2)
- Smartphone with Bluetooth capabilities

## Software Requirements

- PYNQ Linux Image (comes with the `periphery` library for I2C communication)
- Python 3.x
- `periphery` library (already present in PYNQ Linux image)
- Custom Verilog-based UART module for the PYNQ Z2
- ESP32 Firmware with pre-compiled I2S and A2DP functionality

## ESP32 Firmware Configuration

The ESP32 firmware is recompiled with the following key settings to support A2DP and I2S audio stream. These settings are configured within the **`sdkconfig`** file, which is used during the pre-build stage of the ESP32 firmware.

### Key Settings in `sdkconfig`:

- **AT Command Enablement**:
  - `CONFIG_AT_ENABLE=y`
  - `CONFIG_AT_BASE_ON_UART=y`

- **AT UART Settings**:
  - `CONFIG_AT_UART_DEFAULT_DATABITS=8`
  - `CONFIG_AT_UART_DEFAULT_STOPBITS=1`
  - `CONFIG_AT_UART_DEFAULT_PARITY_BITS=0`
  - `CONFIG_AT_UART_DEFAULT_FLOW_CONTROL=0` (No hardware flow control)

- **Bluetooth and I2S Support**:
  - `CONFIG_AT_BT_COMMAND_SUPPORT=y`
  - `CONFIG_AT_BT_A2DP_COMMAND_SUPPORT=y`
  - `CONFIG_AT_I2S_LRCK_PIN=32`
  - `CONFIG_AT_I2S_BCK_PIN=15`
  - `CONFIG_AT_I2S_DATA_PIN=2`

These settings ensure that the ESP32 operates in A2DP mode for Bluetooth audio streaming and communicates with the PYNQ Z2 board using the I2S interface to transmit audio data.

### Building Custom ESP32 Firmware

To build your own custom ESP32 firmware with these settings, you will need to modify the `sdkconfig` file as described above and recompile the firmware. For detailed instructions on how to build your own firmware for the ESP32, please consult the latest documentation for the **ESP-AT Firmware project**. The official documentation provides step-by-step guidance on configuring, building, and flashing the ESP32 firmware to support your desired features.

## ESP32 Pinout

Below is the pinout for the ESP32, reflecting the specific connections for I2S and UART interfaces in this setup:

| **Pin** | **Signal**                | **Description**                                                        |
|---------|---------------------------|------------------------------------------------------------------------|
| 1       | I2S_BCK / SS              | I2S_BCK_PIN / SPI Slave Select (not used in this example)               |
| 2       | RXD / MOSI                | UART Receive Data / SPI Master Out Slave In (not used in this example) |
| 3       | TXD / MISO                | UART Transmit Data / SPI Master In Slave Out (not used in this example)|
| 4       | I2S_BCK / SCK             | I2S_BCK Pin / SPI Serial Clock (not used in this example)              |
| 5       | GND                       | Power Supply Ground                                                   |
| 6       | VCC                       | Power Supply (3.3V)                                                    |
| 7       | I2S_DATA                  | I2S_DATA_PIN / IO2                                                     |
| 8       | EN                        | Reset Enable                                                           |
| 9       | SELECT                    | UART or SPI Mode Select                                                |
| 10      | GPIO                      | Configurable GPIO / IO32                                               |
| 11      | GND                       | Power Supply Ground                                                   |
| 12      | VCC                       | Power Supply (3.3V)                                                    |

Users can consult with the original **PmodESP32 schematic** for the module for further details on the pinout and electrical specifications.

Further information on the pin out from the Zynq side can be found in the `hardware` in `constraints.xdc` file which showcases the used pins and connections from the Zynq SOC side

In the `hardware` folder the user can find information regarding the generated bitstream such as the i2s loopback module and the block design shown in the README file.

The block diagram of the project is the following. This is the block based design in Vivado 2023.2:

![Screenshot](https://github.com/Dekameron55/PYNQ_Z2_Audio_FPGA/blob/main/images/blockDiagram.png)


## Project Overview

1. **ESP32 Bluetooth Setup**:
   - The ESP32 is initialized using custom UART communication on the PYNQ Z2, configured via AT commands to enter A2DP mode for audio streaming.
   - The ESP32 firmware is compiled to support A2DP and I2S, with UART flow control disabled.
   - The ESP32 forwards audio data over I2S to the PYNQ Z2, which passes the data to the ADAU1761 audio codec.

2. **I2S Data Transfer**:
   - Once the ESP32 is configured and paired with a smartphone, it begins receiving audio data over Bluetooth (A2DP).
   - The ESP32 forwards this audio data over I2S to the PYNQ Z2, which passes the data to the ADAU1761 audio codec.

3. **ADAU1761 Configuration**:
   - The ADAU1761 audio codec is configured over I2C from the Zynq PS (Processing System) using the Python `periphery` library.
   - The configuration involves setting PLL locks, audio levels, mixers, and output channels, enabling the codec to process audio data received from the ESP32.

4. **Audio Output**:
   - The ADAU1761 processes the I2S data from the Zynq SoC and outputs the audio through the appropriate audio output channels, such as line-out or headphone-out.

## Future Extensions

This system can serve as a strong foundation for various audio signal processing (DSP) projects. The PYNQ Z2 board provides ample opportunities for extending this setup to include additional audio processing or DSP algorithms. Users can implement custom filters, equalizers, or other audio effects, further enhancing the capabilities of this project.

Additionally, the communication infrastructure with the ESP32 and ADAU1761 codec can be adapted or extended for more complex Bluetooth audio streaming projects, advanced codec configurations, or real-time audio processing tasks.

This platform offers great flexibility and can easily serve as the basis for future development in audio signal processing, streaming applications, or embedded DSP projects.

## Disclaimer
Disclaimer: This project is provided "as-is," without any warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, or non-infringement. The authors are not liable for any damages arising from the use of this project. Use this project at your own risk. By using this project, you agree to take full responsibility for any consequences, including but not limited to hardware damage, loss of data, or other risks associated with the use of this project.