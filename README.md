# ACS Egham bell board

A single-file display board for a classroom or corridor screen:

- **Google Slides** filling most of the screen as an embedded iframe
- **Clock** along the bottom
- **Bell** that chimes at the school's period times
- **Current part of the school day** on the right ("P2 · until 11:25 · 14 min left")

Everything is in [`index.html`](index.html) — no build step, no dependencies, no server.
The chimes are synthesised in the browser, so there is no audio file to host.

## Running it

| How | What to do |
| --- | --- |
| Quick look | Double-click `index.html` |
| Wall display (Windows) | Double-click `Bell Board (Kiosk).bat` — full screen, no tabs, no address bar. Alt+F4 to quit. |
| Hosted (GitHub Pages) | Enable Pages on this repo, then open the published URL |
| Google Sites | Insert → Embed → By URL, using the Pages URL |

## Settings

Click the ⚙ icon on the bottom bar. Settings are saved in the browser and cover the
Slides link, slide auto-advance, bell sound, repeat count, a custom sound-file URL,
and the bell times.

Storage can be blocked inside an embed or on a `file://` page, so settings can also be
passed in the URL, which always wins:

```
?slides=<slides url>&times=08:30,08:55,10:25&delay=20&tune=glock&file=<mp3 url>
```

`tune` is one of `westminster`, `chime`, `strike`, `dingdong`, `glock`, `electric`, `file`.

## Sound

Browsers block audio until someone clicks. Press **Enable sound** in the settings panel
once after the display starts each day. The kiosk launcher passes
`--autoplay-policy=no-user-gesture-required`, which removes that step.

If sound is still locked, the bell falls back to flashing the screen amber.

## Bell times

Default: 08:30, 08:55, 10:25, 11:25, 12:30, 13:25, 14:30 — editable in the ⚙ panel.

## School day

The labels on the right come from the `SCHEDULE` array near the top of the script in
`index.html`. Edit that list to change them.

| From | Shows |
| --- | --- |
| — | Students arriving |
| 08:30 | AM Registration |
| 08:55 | P1 |
| 09:55 | Break |
| 10:25 | P2 |
| 11:25 | Moving to P3 |
| 11:30 | P3 |
| 12:30 | Lunch |
| 13:25 | P4 |
| 14:25 | Moving to P5 |
| 14:30 | P5 |
| 15:30 | Home time |
| 17:25 | Time to go home |
| 17:45 | School day over |

## Note

The clock uses the display computer's own time, so make sure that machine is time-synced.
Keep the board as the active tab — a backgrounded tab can have its timers throttled and
delay a bell.
