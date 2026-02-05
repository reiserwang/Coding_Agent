import os
import json
import re
from datetime import datetime, timezone

def generate_track_id(description):
    """Generate a unique track ID from the description."""
    # Convert description to short name: lowercase, alphanumeric and underscores
    short_name = re.sub(r'[^a-zA-Z0-9\s]', '', description).lower()
    short_name = "_".join(short_name.split()[:3]) # Take first 3 words
    today = datetime.now(timezone.utc).strftime("%Y%m%d")
    return f"{short_name}_{today}"

def create_track_artifacts(description):
    """Create the directory and metadata.json for a new track."""
    track_id = generate_track_id(description)
    tracks_dir = os.path.join("conductor", "tracks")
    track_dir = os.path.join(tracks_dir, track_id)
    
    if not os.path.exists(track_dir):
        os.makedirs(track_dir)
        
    metadata = {
        "track_id": track_id,
        "type": "feature",
        "status": "new",
        "created_at": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "updated_at": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "description": description
    }
    
    metadata_path = os.path.join(track_dir, "metadata.json")
    with open(metadata_path, "w") as f:
        json.dump(metadata, f, indent=2)
        
    return track_id
