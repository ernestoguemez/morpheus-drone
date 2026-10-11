# Hardware

## Parts

| Part | Specification | Notes |
|---|---|---|
| Frame | Mark4 5 in carbon fiber, 5 mm arms, 16 x 16 mm motor mount | |
| Motors | EMAX ECO II 2207 2400KV x 4, M3 mount, for 3S to 4S | |
| Flight controller and ESC | SpeedyBee F405 V5 stack, 55 A 4-in-1 ESC, 30.5 x 30.5 mm, 3S to 6S | Stacked, nylon nuts |
| Receiver | HappyModel EP2, ELRS 2.4 GHz, chip antenna | Soldered to UART6 |
| Radio | RadioMaster Pocket, CC2500 version | Internal RF off |
| Radio module | Jumper Aion ELRS 2.4 GHz Nano TX | External bay, CRSF |
| Propellers | HQProp 5 x 4.3 x 3 V1S | |
| Battery | GNB 4S 1300 mAh LiPo, 120C, XT60 | Two packs |
| Charger | HotRC A400, balance mode | LiPo safety bag |
| Weight | About 650 g | |

Parts for Phase 3, not installed: Raspberry Pi Zero 2 W with a 64 GB microSD, Beitian BN-880 GPS with compass, SiK radio 915 MHz air and ground pair.

## Wiring notes

- Power and ground connect straight through. Transmit and receive cross over. SDA and SCL connect straight through. Reversing 5 V and ground burns the component.
- The receiver connects to UART6: 5 V and ground direct, TX and RX crossed.
- Twelve motor wires and a capacitor are soldered to the ESC. The battery lead is an XT60.
- The flight controller sits on the ESC, fixed and level.
- Carbon fiber conducts. The receiver sits under a plastic cover, away from the frame.
- The battery is strapped on and centered over the middle of the frame, within about 1 cm. The flight controller corrects momentary disturbances but not a constant imbalance.

## Practices

Before connecting a battery after any soldering:

1. Multimeter continuity test, no short between power and ground.
2. First power-up through a smoke stopper (a 12 V car bulb in series with the battery lead). See [log entry 5](../engineering-log.md).

Before flying:

1. Propeller direction matches motor direction: M1 and M4 clockwise, M2 and M3 counterclockwise (Betaflight motor diagram).
2. Propellers go on last. Configuration is always done with propellers removed.
3. Battery charged in balance mode, inside a LiPo bag.
4. Open field, 30 to 100 m from people and buildings. Never arm near yourself.
5. Record video.
