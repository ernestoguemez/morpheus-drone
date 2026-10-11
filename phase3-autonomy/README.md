# Phase 3: autonomy

**Status: planned. Nothing here is built or flying.** This page is the plan, and the reasoning behind it.

## Goal

A quadcopter that takes off, flies a route of GPS waypoints, returns to launch and lands by itself, commanded by a Python program on a Raspberry Pi through MAVLink.

## Order of work

1. Finish Phase 2: tune and fly Morpheus manually in Betaflight.
2. Reflash the flight controller to ArduPilot (Copter). Betaflight does not support waypoint missions beyond a basic GPS rescue. The reflash erases the Betaflight settings and there is no one-to-one migration of PIDs or modes, so this happens only after Phase 2 is done.
3. Add hardware: GPS with compass, telemetry radio, Raspberry Pi.
4. Write and test mission code in software-in-the-loop (SITL) simulation before it ever flies.
5. Configure failsafes, then fly the first autonomous mission.

Preparation that does not touch the drone (Raspberry Pi setup, MAVLink, SITL, Python scripts) can happen in parallel with Phase 2. Anything physical on the drone (reflashing, soldering) waits.

## Scope

In scope:

- ArduPilot on the SpeedyBee F405 V5
- Beitian BN-880 GPS and compass on UART4 (position) and I2C (compass)
- SiK telemetry radio, 915 MHz, air and ground pair, on UART2, for monitoring from the ground
- Raspberry Pi Zero 2 W connected over USB, running pymavlink
- A dedicated 5 V regulator for the Pi, so a current spike from the Pi cannot brown out the flight controller in flight
- Failsafes: geofence, return to launch on low battery, response to signal loss

Out of scope, on purpose:

- **A documentation camera.** Its value is gyro stabilization for aggressive flying, which this project does not do. It does not contribute to the autonomy goal.
- **Digital FPV video (DJI, Walksnail, HDZero).** It lets the pilot see, not the drone fly itself. It adds cost, weight and a new piloting skill. It becomes a candidate for a later phase only if basic autonomy works and time remains.

## UART plan

| Port | Use |
|---|---|
| UART1 | Internal Bluetooth, not usable in ArduPilot |
| UART2 | SiK telemetry radio (planned) |
| UART3 | Reserved by the board for a digital VTX, free |
| UART4 | GPS (planned) |
| UART5 | ESC telemetry (already assigned) |
| UART6 | RC receiver (already assigned) |
| USB | Raspberry Pi, MAVLink over USB, so no UART is consumed |

Source: ArduPilot hardware definition for the SpeedyBee F405 V5 (`speedybeef4v5`).

## Hardware in hand, not mounted

Raspberry Pi Zero 2 W with a 64 GB microSD, Beitian BN-880 GPS with compass, SiK Radio V3 915 MHz pair. The GPS will go on a raised mast at the back, away from the power wiring.

## Code

None yet. Mission scripts will live in this folder once they exist and have been tested in SITL.
