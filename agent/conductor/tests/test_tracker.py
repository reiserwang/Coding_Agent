import json
import os
import pytest
from datetime import datetime
from agent.conductor.tracker import create_track_artifacts

def test_create_track_artifacts(tmp_path):
    """Test that track directory and metadata.json are created correctly."""
    os.chdir(tmp_path)
    os.mkdir("conductor")
    os.mkdir("conductor/tracks")
    
    description = "Test Track"
    # Expected track ID format: shortname_YYYYMMDD
    today = datetime.now().strftime("%Y%m%d")
    expected_track_id = f"test_track_{today}"
    
    track_id = create_track_artifacts(description)
    
    assert track_id == expected_track_id
    track_dir = tmp_path / "conductor" / "tracks" / track_id
    assert track_dir.exists()
    
    metadata_file = track_dir / "metadata.json"
    assert metadata_file.exists()
    
    with open(metadata_file, "r") as f:
        metadata = json.load(f)
        assert metadata["track_id"] == track_id
        assert metadata["description"] == description
        assert metadata["status"] == "new"
        assert "created_at" in metadata
