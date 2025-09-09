import re

# Define regexes for different targets
PATTERNS = {
    "url": r'https?://[^\s]+',
    "git-hash": r'\b[0-9a-f]{7,40}\b',
    "branch": r'\b[\w\-/]+(?=\s*\|?\s*upstream|\s*\|?\s*origin|\s*$)',
    "filename": r'\b[\w./-]+\.\w+\b',
    "function": r'\b[A-Za-z_][A-Za-z0-9_]*(?=\s*\()',
}

def mark(text, args, Mark, extra_cli_args, *a):
    """Scan screen text and mark all matches."""
    idx = 0
    for name, pattern in PATTERNS.items():
        for m in re.finditer(pattern, text):
            start, end = m.span()
            label = f"{name}:{m.group(0)}"
            yield Mark(idx, start, end, m.group(0), {"type": name})
            idx += 1

def handle_result(args, data, target_window_id, boss, extra_cli_args, *a):
    """What happens when user picks a match."""
    if not data.get("match"): 
        return
    match = data["match"]
    mtype = data.get("groupdict", {}).get("type", "text")

    if mtype == "url":
        boss.open_url(match)
    elif mtype == "git-hash":
        boss.launch("echo", [match], target_window_id)   # customize
    else:
        # Default: insert into shell
        boss.launch("kitty", ["@", "send-text", "-m", "id:%d" % target_window_id, match])
