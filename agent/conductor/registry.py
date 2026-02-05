import os

def append_track_to_registry(track_id, description):
    """Append a new track entry to conductor/tracks.md."""
    path = os.path.join("conductor", "tracks.md")
    
    entry = f"\n---\n\n- [ ] **Track: {description}**\n  *Link: [./tracks/{track_id}/](./tracks/{track_id}/)*\n"
    
    if not os.path.exists(path):
        with open(path, "w") as f:
            f.write("# Project Tracks\n\nThis file tracks all major tracks for the project. Each track has its own detailed plan in its respective folder.\n")
            f.write(entry)
        return

    with open(path, "a") as f:
        f.write(entry)