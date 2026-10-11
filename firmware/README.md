# Firmware

Morpheus runs **Betaflight 2026.6.1** on the `SPEEDYBEEF405V5` target with CRSF enabled. The factory firmware (4.5.2) did not include CRSF, so I reflashed it.

## Verified configuration

| Item | Setting or result |
|---|---|
| Ports | UART6 serial RX (receiver), UART4 GPS (reserved), UART5 ESC telemetry |
| Receiver | Serial via UART, provider CRSF. Bound radio and receiver, channels respond in AETR order. |
| Sensors | ICM42688P gyro and accelerometer, DPS310 barometer, board alignment 0/0/0 |
| Accelerometer | Calibrated, pitch and roll near zero and stable |
| Mixer | QUAD X |
| ESC protocol | DSHOT600, motor idle 5.5%, motor stop off |
| Motor direction | M1 CW, M2 CCW, M3 CCW, M4 CW. M1 and M4 reversed with the Motor direction assistant, no resoldering. |
| Battery | 4S, voltage scale 110, minimum 3.3 V and warning 3.5 V per cell |
| Voltage check | 15.2 V in Betaflight against 15.3 V on a multimeter |
| Modes | ARM and Angle |
| Failsafe | Tested. Motors cut about one second after the radio is switched off. |

Radio side (RadioMaster Pocket): Internal RF off, External RF set to CRSF for the Jumper Aion module.

## Not done yet

Bidirectional DShot with RPM filtering is off for now. The ESC supports it. I will turn it on during tuning.

## Configuration exports

To make this configuration reproducible, add these files from the Betaflight CLI tab:

| File | How to create it |
|---|---|
| `betaflight-diff-all.txt` | Run `diff all` in the CLI and paste the output |
| `betaflight-status.txt` | Run `status` in the CLI and paste the output |

## Phase 3

Autonomy needs ArduPilot, which replaces Betaflight on this flight controller. Betaflight settings are erased by that reflash, so the exports above are also the record of what the drone was tuned to. See [`../phase3-autonomy/`](../phase3-autonomy/README.md).
