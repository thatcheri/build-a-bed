import re
from pathlib import Path

html_path = Path(r"c:\Users\Western-Highways\Desktop\BUILD YOUR TMA BED ONLINE\classic 1 web.HTML")
txt = html_path.read_text(encoding='utf-8', errors='ignore')

patterns = [
    r'#[0-9a-fA-F]{3,6}',
    r'rgba?\([^\)]+\)',
    r'(?<=color:\s*)[a-zA-Z]+',
    r'(?<=background-color:\s*)[a-zA-Z]+',
    r'(?<=border-color:\s*)[a-zA-Z]+',
    r'(?<=stroke:\s*)[a-zA-Z]+'
]

found = set()
for pat in patterns:
    for m in re.findall(pat, txt, re.IGNORECASE):
        found.add(m.strip())

for v in sorted(found, key=lambda s: s.lower()):
    print(v)
