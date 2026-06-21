#!/usr/bin/env python3
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "assets" / "social-preview.png"
WIDTH = 1280
HEIGHT = 640


def font(size: int, bold: bool = False) -> ImageFont.FreeTypeFont:
    candidates = [
        "/System/Library/Fonts/Supplemental/Inter.ttc",
        "/System/Library/Fonts/Supplemental/Arial Bold.ttf" if bold else "/System/Library/Fonts/Supplemental/Arial.ttf",
        "/System/Library/Fonts/Helvetica.ttc",
    ]
    for candidate in candidates:
        path = Path(candidate)
        if path.exists():
            try:
                return ImageFont.truetype(str(path), size=size)
            except OSError:
                continue
    return ImageFont.load_default()


def draw_wrapped(draw: ImageDraw.ImageDraw, text: str, xy: tuple[int, int], font_obj: ImageFont.ImageFont, fill: str) -> None:
    draw.text(xy, text, font=font_obj, fill=fill)


def main() -> None:
    OUT.parent.mkdir(parents=True, exist_ok=True)
    image = Image.new("RGB", (WIDTH, HEIGHT), "#0b1020")
    draw = ImageDraw.Draw(image)

    # Subtle grid and lane blocks: structure without competing with the text.
    for x in range(0, WIDTH, 64):
        draw.line((x, 0, x, HEIGHT), fill="#111936", width=1)
    for y in range(0, HEIGHT, 64):
        draw.line((0, y, WIDTH, y), fill="#111936", width=1)

    lane_colors = ["#1b2a4a", "#26365f", "#123b34", "#3d2f19", "#3b2032"]
    lane_positions = [(78, 86), (220, 88), (362, 88), (504, 88), (646, 88)]
    for idx, (x, y) in enumerate(lane_positions):
        draw.rounded_rectangle((x, y, x + 92, y + 320), radius=18, fill=lane_colors[idx], outline="#334155", width=2)
        draw.rounded_rectangle((x + 18, y + 36, x + 74, y + 92), radius=12, fill="#94a3b8")
        draw.rounded_rectangle((x + 18, y + 124, x + 74, y + 180), radius=12, fill="#475569")
        draw.rounded_rectangle((x + 18, y + 212, x + 74, y + 268), radius=12, fill="#64748b")

    draw.rounded_rectangle((820, 92, 1190, 548), radius=34, fill="#f8fafc", outline="#38bdf8", width=4)
    for y in [164, 232, 300, 368, 436]:
        draw.rounded_rectangle((870, y, 1140, y + 28), radius=14, fill="#dbeafe")
    draw.rounded_rectangle((870, 480, 1042, 518), radius=19, fill="#0f766e")

    title_font = font(58, bold=True)
    subtitle_font = font(40, bold=True)

    draw.rounded_rectangle((76, 350, 1204, 606), radius=34, fill="#0b1020", outline="#22d3ee", width=3)
    draw.multiline_text(
        (110, 378),
        "Tests pass.\nYour repo is still a mess.",
        font=title_font,
        fill="#f8fafc",
        spacing=2,
    )
    draw_wrapped(draw, "AI Worktree Hygiene fixes the handoff.", (110, 528), subtitle_font, "#67e8f9")

    image.save(OUT, "PNG", optimize=True)
    print(f"Wrote {OUT} ({WIDTH}x{HEIGHT})")


if __name__ == "__main__":
    main()
