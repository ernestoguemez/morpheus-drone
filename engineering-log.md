# Engineering log

Five things that went wrong while building Morpheus, and two smaller ones. Each entry follows the same shape: symptom, diagnosis, root cause, fix, lesson. I chose to highlight these five because they all required a totally different way of thinking. Fixing them was usually quick, but the diagnosis is the part I really found interesting.

## 1. The wrong motors

*Competency: sourcing diligence.*

- **Symptom.** The motors showed up, but they were size 2006 instead of the 2207s I needed.
- **Diagnosis.** I noticed it right in the middle of assembly when the specs didn't match what I had planned.
- **Root cause.** I trusted the title on AliExpress instead of checking the specific variant I was clicking on.
- **Fix.** I opened a dispute, ordered the right 2207 motors, and waited for them to arrive.
- **Lesson.** The title is marketing; the variant you select is what you're actually buying.

![The wrong motors](docs/assets/photos/log1_motors.jpg)

## 2. A radio that could not speak to the receiver

*Competency: systems thinking.*

- **Symptom.** My RadioMaster Pocket didn't have an ELRS option, but my receiver only speaks ELRS.
- **Diagnosis.** I checked the box again and realized ELRS was a product option, and I had accidentally bought the CC2500 version.
- **Root cause.** Since they run on completely different radio chips, no firmware update was ever going to bridge them.
- **Fix.** I fixed it by snapping a Jumper Aion ELRS module into the external bay and switching the settings to CRSF. But then the new module got stuck on "Loading". Turns out I needed to reseat the module properly on its data pins.
- **Lesson.** Always check the actual chips your hardware uses, since menus and packaging can be misleading.

![Radio menu, Internal RF options](docs/assets/photos/log2_menu.jpg)
![Module stuck on Loading](docs/assets/photos/log2_module.jpg)

## 3. The drone that would not arm

*Competency: methodical debugging.*

- **Symptom.** The radio kept saying "armed", but the motors weren't doing anything.
- **Diagnosis.** Instead of messing with random settings, I checked the arming flags with the CLI status command. Only CLI and MSP were set, which just come from being plugged into a computer over USB, so they're harmless. There was no RXLOSS or FAILSAFE, so the receiver link was completely fine.

  ```
  Arming disable flags: CLI MSP
  ```

- **Root cause.** The problem was that the controller wasn't getting the arm command because my ARM switch range got messed up when I swapped radio modules.
- **Fix.** I tweaked the ARM range in the Modes tab, and the motors finally started up.
- **Lesson.** Just because the radio says it's armed doesn't mean the drone agrees. You have to check the drone's actual flags.

![CLI status output](docs/assets/photos/log3_cli.jpg)
![Modes tab, ARM range](docs/assets/photos/log3_modes.jpg)

## 4. Motors screaming, no lift

*Competency: systematic elimination.*

- **Symptom.** On my very first try, the motors spun up at full speed but the drone just sat on the ground.
- **Diagnosis.** Since the electronics and radio were working, it had to be a thrust issue. All four motors were failing the exact same way, which pointed straight to the propellers.
- **Root cause.** Turns out, I had mounted all four propellers upside down.
- **Fix.** I flipped them over, double-checked the spin directions, and it took off.
- **Lesson.** Rule out what's working first, then find the common denominator. Checking prop direction is definitely on my checklist now.

![The no-lift attempt](docs/assets/photos/log4_noLift.jpg)

## 5. A smoke stopper from a car bulb

*Competency: safety and resourcefulness.*

- **Symptom.** I was about to plug in the battery for the first time, but I didn't have a smoke stopper, and a short circuit would easily melt my wiring.
- **Diagnosis.** I needed a way to limit the current just in case, and I didn't want to wait days for a tool to ship.
- **Root cause.** It wasn't a failure, just a missing tool and a risk I didn't want to take.
- **Fix.** So I wired a 12V car bulb in series with the battery. If there's a short, the bulb lights up and saves the board. I also ran a multimeter continuity test before connecting power.
- **Lesson.** Always make sure your first power-up is survivable before you actually do it.

![Bulb in series with the battery lead](docs/assets/photos/log5_bulb.jpg)

## Also fixed

| Problem | Cause and fix |
|---|---|
| Charge-only USB cable | Betaflight couldn't see the drone because I was using a charge-only cable. Swapping to a data cable fixed it instantly. |
| CRSF missing from firmware | The factory firmware didn't support CRSF, so I reflashed it to 2026.6.1 with CRSF enabled. |
