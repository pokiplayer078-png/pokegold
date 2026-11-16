#!/usr/bin/env python3
"""Generate original 2bpp-ready Banibus monster sprites for Pokémon Gold."""
from pathlib import Path
import struct, zlib, binascii

ROOT = Path("gfx/pokemon")
# Transparent, outline, body, light. Keep to four colors for GBC 2bpp.
CREATURES = [
    ("bulbasaur", "Escarabeu", "#C58B35", "#F2CF77", "beetle"),
    ("ivysaur", "Scarabrex", "#87603A", "#D6A75B", "scarabrex"),
    ("venusaur", "Duneko", "#C88B45", "#F2D09A", "lizard"),
    ("charmander", "Dunekobra", "#B98543", "#E7C47F", "cobra"),
    ("charmeleon", "Oasling", "#4B9A55", "#A9D86B", "sprout"),
    ("charizard", "Oasisphinx", "#4C9856", "#B8D47A", "sphinx"),
    ("squirtle", "Cactusk", "#3C9850", "#A6D76B", "cactus"),
    ("wartortle", "Cactitan", "#287C42", "#8CCB58", "bigcactus"),
    ("blastoise", "Rocadillo", "#8F8069", "#D2C2A0", "armadillo"),
    ("articuno", "Rocadune", "#A17A4C", "#E0B66D", "rockbeast"),
    ("zapdos", "Miragato", "#B8874A", "#E7CE8D", "cat"),
    ("moltres", "Mirajaguar", "#55436F", "#A78BC8", "shadowcat"),
    ("mewtwo", "Akarit", "#B94B2C", "#FF9B35", "firelizard"),
    ("mew", "Akarum", "#7F332B", "#F08A35", "firebeast"),
]

def png_chunk(kind, data):
    body = kind + data
    return struct.pack(">I", len(data)) + body + struct.pack(">I", binascii.crc32(body) & 0xffffffff)

def write_png(path, pixels, palette, size=56):
    w = h = size
    rows = bytearray()
    rgba = [(0, 0, 0, 0), (0, 0, 0, 255), tuple(int(palette[0][i:i+2],16) for i in (1,3,5))+(255,), tuple(int(palette[1][i:i+2],16) for i in (1,3,5))+(255,)]
    for y in range(h):
        rows.append(0)
        for x in range(w):
            rows.extend(rgba[pixels[y][x]])
    data = b"\x89PNG\r\n\x1a\n"
    data += png_chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0))
    data += png_chunk(b"IDAT", zlib.compress(bytes(rows), 9))
    data += png_chunk(b"IEND", b"")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)

class Canvas:
    def __init__(self, back=False):
        self.p = [[0 for _ in range(56)] for _ in range(56)]
        self.back = back
    def put(self, x, y, c):
        if 0 <= x < 56 and 0 <= y < 56:
            self.p[y][x] = c
    def rect(self, x1,y1,x2,y2,c):
        for y in range(y1,y2+1):
            for x in range(x1,x2+1): self.put(x,y,c)
    def ellipse(self, cx,cy,rx,ry,c):
        for y in range(cy-ry,cy+ry+1):
            for x in range(cx-rx,cx+rx+1):
                if ((x-cx)/max(1,rx))**2 + ((y-cy)/max(1,ry))**2 <= 1: self.put(x,y,c)
    def poly(self, pts, c):
        ymin=max(0,min(y for _,y in pts)); ymax=min(55,max(y for _,y in pts))
        for y in range(ymin,ymax+1):
            xs=[]
            for i in range(len(pts)):
                x1,y1=pts[i]; x2,y2=pts[(i+1)%len(pts)]
                if y1==y2: continue
                if min(y1,y2) <= y < max(y1,y2):
                    xs.append(int(x1+(y-y1)*(x2-x1)/(y2-y1)))
            xs.sort()
            for i in range(0,len(xs)-1,2):
                for x in range(xs[i],xs[i+1]+1): self.put(x,y,c)
    def line(self,x1,y1,x2,y2,c,width=2):
        dx=abs(x2-x1); dy=abs(y2-y1); sx=1 if x1<x2 else -1; sy=1 if y1<y2 else -1
        err=dx-dy
        while True:
            self.rect(x1-width//2,y1-width//2,x1+width//2,y1+width//2,c)
            if x1==x2 and y1==y2: break
            e2=2*err
            if e2>-dy: err-=dy; x1+=sx
            if e2<dx: err+=dx; y1+=sy
    def outline(self):
        # pixelated one-pixel dark rim around opaque pixels
        src=[row[:] for row in self.p]
        for y in range(56):
            for x in range(56):
                if src[y][x] != 0: continue
                if any(0<=x+dx<56 and 0<=y+dy<56 and src[y+dy][x+dx] in (2,3) for dx,dy in ((-1,0),(1,0),(0,-1),(0,1))):
                    self.p[y][x]=1
    def eye(self,x,y):
        if not self.back:
            self.put(x,y,1); self.put(x+1,y,3); self.put(x,y+1,1)

def draw(kind, back=False):
    c=Canvas(back)
    # Creature silhouette is built from original geometric pixel-art forms.
    if kind in ("beetle","scarabrex"):
        big=kind=="scarabrex"
        c.ellipse(28,36,19 if big else 15,12,2)
        c.ellipse(28,24,13 if big else 10,10,2)
        c.poly([(17,21),(11,13),(18,15),(22,23)],2); c.poly([(39,21),(45,13),(38,15),(34,23)],2)
        c.ellipse(28,36,15 if big else 12,8,3)
        c.line(20,43,15,50,2,4); c.line(36,43,41,50,2,4)
        c.line(14,36,8,42,2,3); c.line(42,36,48,42,2,3)
        c.poly([(28,16),(23,23),(28,31),(33,23)],3)
        if big:
            c.poly([(15,27),(8,21),(14,20),(20,25)],3); c.poly([(41,27),(48,21),(42,20),(36,25)],3)
        if not back: c.eye(21,26); c.eye(33,26)
        c.line(28,6,24,15,1,2); c.line(28,6,32,15,1,2)
    elif kind=="lizard":
        c.ellipse(26,34,16,10,2); c.ellipse(38,27,9,7,2)
        c.poly([(12,33),(4,26),(7,39),(17,39)],2)
        c.poly([(36,43),(44,49),(48,45),(43,40)],2)
        c.line(20,40,17,50,2,4); c.line(34,41,37,50,2,4)
        c.poly([(39,20),(41,12),(46,20),(43,25)],3)
        c.ellipse(24,31,7,3,3)
        if not back: c.eye(40,26)
        c.put(15,30,3); c.put(22,26,3)
    elif kind=="cobra":
        c.ellipse(28,44,17,7,2); c.ellipse(28,33,12,6,2)
        c.poly([(18,35),(14,25),(16,12),(28,7),(40,12),(42,25),(38,35),(33,29),(28,25),(23,29)],2)
        c.poly([(21,29),(21,16),(28,12),(35,16),(35,29),(28,25)],3)
        c.poly([(22,18),(18,13),(22,8),(25,15)],3); c.poly([(34,18),(38,13),(34,8),(31,15)],3)
        if not back: c.eye(22,18); c.eye(33,18)
        c.poly([(25,28),(31,28),(28,36)],3)
    elif kind in ("sprout","sphinx"):
        if kind=="sprout":
            c.ellipse(28,39,11,12,2); c.ellipse(28,28,8,8,3)
            c.poly([(24,24),(12,8),(26,17),(28,5),(31,18),(45,9),(34,25)],3)
            c.line(23,47,19,53,2,3); c.line(33,47,37,53,2,3)
        else:
            c.ellipse(28,37,17,11,2); c.ellipse(28,23,11,10,2)
            c.poly([(18,22),(11,10),(21,15),(27,7),(32,15),(43,10),(38,25)],3)
            c.line(18,43,14,51,2,5); c.line(38,43,42,51,2,5)
            c.ellipse(28,37,10,6,3)
        if not back: c.eye(22,24); c.eye(32,24)
        c.put(28,34,1)
    elif kind in ("cactus","bigcactus"):
        big=kind=="bigcactus"
        c.rect(22 if big else 24,17 if big else 23,33 if big else 31,49,2)
        c.ellipse(28,18 if big else 24,6,6,2)
        c.rect(10,28 if big else 31,19,35 if big else 38,2); c.rect(9,22 if big else 26,14,32,2)
        c.rect(37,25 if big else 30,45,32 if big else 37,2); c.rect(40,18 if big else 24,44,29,2)
        c.ellipse(28,18,4,5,3)
        for y in range(25,48,7): c.put(20,y,3); c.put(35,y+2,3)
        if not back: c.eye(25,26); c.eye(30,26)
        c.rect(22,50,26,53,1); c.rect(31,50,35,53,1)
    elif kind in ("armadillo","rockbeast"):
        big=kind=="rockbeast"
        c.ellipse(28,35,19 if big else 16,13,2)
        c.ellipse(28,31,14 if big else 12,9,3)
        c.poly([(12,32),(5,28),(8,40),(16,43)],2); c.poly([(44,32),(51,28),(48,40),(40,43)],2)
        c.line(17,42,14,51,2,5); c.line(39,42,42,51,2,5)
        for x,y in ((18,28),(27,22),(36,28),(22,37),(32,37)):
            c.poly([(x,y-5),(x+4,y),(x,y+5),(x-4,y)],2 if big else 3)
        c.ellipse(28,18,9,6,2)
        if not back: c.eye(20,31); c.eye(34,31)
    elif kind in ("cat","shadowcat"):
        c.ellipse(28,37,16,10,2); c.ellipse(28,23,11,10,2)
        c.poly([(18,19),(13,5),(25,14),(28,9),(32,14),(44,5),(38,22)],2)
        c.poly([(20,16),(17,9),(24,15)],3); c.poly([(36,16),(41,9),(33,15)],3)
        c.line(14,38,6,30,2,4); c.line(6,30,3,24,2,3)
        c.line(39,42,44,50,2,4)
        c.line(20,43,16,51,2,4); c.line(36,43,40,51,2,4)
        c.poly([(23,29),(28,32),(33,29),(28,35)],3)
        if not back: c.eye(21,23); c.eye(34,23)
        if kind=="shadowcat":
            c.put(14,32,3); c.put(40,35,3); c.put(28,40,3)
    elif kind in ("firelizard","firebeast"):
        big=kind=="firebeast"
        c.ellipse(27,36,17 if big else 14,10,2); c.ellipse(38,28,9,7,2)
        c.poly([(35,22),(36,7),(43,15),(44,5),(50,19),(43,27)],3)
        c.poly([(16,31),(6,22),(8,36),(19,39)],2)
        c.line(19,42,15,51,2,4); c.line(35,42,39,51,2,4)
        c.poly([(20,27),(13,17),(24,21),(27,12),(31,23)],3)
        c.ellipse(27,37,9,4,3)
        if not back: c.eye(38,27)
        c.put(14,34,3); c.put(23,32,3)
    if back:
        # Back-facing variant: remove front-facing eye pixels and add a dorsal motif.
        for y in range(18,38):
            for x in range(18,39):
                if c.p[y][x] == 1: c.p[y][x] = 2
        c.ellipse(28,31,5,8,3)
    c.outline()
    return c.p

def footprint(kind):
    p=[[0 for _ in range(16)] for _ in range(16)]
    # Three compact toes and one heel pad, with silhouette variations by family.
    if kind in ("beetle","scarabrex","armadillo","rockbeast"):
        pads=[(4,4,3,3),(8,3,3,3),(12,4,2,3),(8,10,4,4)]
    elif kind in ("lizard","cobra","firelizard","firebeast"):
        pads=[(3,4,3,3),(7,3,3,3),(11,4,3,3),(7,10,4,4)]
    elif kind in ("sprout","sphinx","cactus","bigcactus"):
        pads=[(4,3,3,3),(9,3,3,3),(6,9,5,4)]
    else:
        pads=[(3,4,3,3),(8,3,3,3),(12,4,2,3),(8,10,4,4)]
    for cx,cy,rx,ry in pads:
        for y in range(16):
            for x in range(16):
                if ((x-cx)/max(1,rx))**2+((y-cy)/max(1,ry))**2<=1: p[y][x]=1
    return p

SHINY = {
    "bulbasaur": ("18, 28, 9", "31, 14, 5"),
    "ivysaur": ("12, 25, 16", "30, 20, 8"),
    "venusaur": ("25, 18, 8", "31, 28, 18"),
    "charmander": ("18, 24, 31", "29, 19, 8"),
    "charmeleon": ("20, 30, 18", "31, 24, 10"),
    "charizard": ("10, 22, 24", "31, 30, 16"),
    "squirtle": ("15, 27, 30", "31, 31, 12"),
    "wartortle": ("08, 24, 15", "28, 31, 18"),
    "blastoise": ("23, 22, 16", "31, 31, 28"),
    "articuno": ("27, 20, 10", "31, 30, 18"),
    "zapdos": ("13, 27, 18", "31, 25, 8"),
    "moltres": ("25, 17, 31", "31, 28, 14"),
    "mewtwo": ("31, 20, 8", "18, 10, 6"),
    "mew": ("31, 26, 9", "17, 8, 12"),
}

def main():
    for folder, label, dark, light, kind in CREATURES:
        palette=(dark, light)
        front=draw(kind, False)
        back=draw(kind, True)
        directory=ROOT/folder
        write_png(directory/"front_gold.png", front, palette)
        write_png(directory/"front_silver.png", front, palette)
        write_png(directory/"back.png", back, palette)
        (directory/"shiny.pal").write_text("\n\tRGB "+SHINY[folder][0]+"\n\tRGB "+SHINY[folder][1]+"\n\n")
        write_png(Path("gfx/footprints")/(folder+".png"), footprint(kind), ("#FFFFFF", "#FFFFFF"), size=16)
        print(f"generated {label} -> {directory}")
if __name__ == "__main__":
    main()
