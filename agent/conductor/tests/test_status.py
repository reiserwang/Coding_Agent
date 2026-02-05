import json
import os
import pytest
from agent.conductor.tracker import update_track_status

def test_update_track_status(tmp_path):
    """Test updating the status in metadata.json."""
    os.chdir(tmp_path)
    os.makedirs("conductor/tracks/test_track")
    metadata_file = tmp_path / "conductor" / "tracks" / "test_track" / "metadata.json"
    metadata_data = {
        "track_id": "test_track",
        "status": "new",
        "updated_at": "2026-02-05T00:00:00Z"
    }
    metadata_file.write_text(json.dumps(metadata_data))
    
    update_track_status("test_track", "in_progress")
    
    with open(metadata_file, "r") as f:
        updated_metadata = json.load(f)
        assert updated_metadata["status"] == "in_progress"
        assert updated_metadata["updated_at"] != "2026-02-05T00:00:00Z"

def test_update_track_status_missing(tmp_path):
    """Test updating status for a missing track."""
    os.chdir(tmp_path)
    # Should not raise error, just return False or similar
    result = update_track_status("nonexistent", "completed")
    assert result is False
