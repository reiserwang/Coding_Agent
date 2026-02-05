import os
import pytest
from agent.conductor.registry import append_track_to_registry

def test_append_track_to_registry(tmp_path):
    """Test appending a new track to tracks.md."""
    os.chdir(tmp_path)
    os.mkdir("conductor")
    tracks_file = tmp_path / "conductor" / "tracks.md"
    tracks_file.write_text("# Project Tracks\n\nThis file tracks all major tracks.\n\n---\n")
    
    track_id = "test_track_20260205"
    description = "A Test Track"
    
    append_track_to_registry(track_id, description)
    
    content = tracks_file.read_text()
    assert f"- [ ] **Track: {description}**" in content
    assert f"*Link: [./tracks/{track_id}/](./tracks/{track_id}/)*" in content

def test_append_track_to_registry_no_file(tmp_path):
    """Test that append_track_to_registry handles missing file gracefully (or creates it)."""
    os.chdir(tmp_path)
    os.mkdir("conductor")
    # File doesn't exist yet
    
    track_id = "test_track_20260205"
    description = "A Test Track"
    
    append_track_to_registry(track_id, description)
    
    tracks_file = tmp_path / "conductor" / "tracks.md"
    assert tracks_file.exists()
    assert f"**Track: {description}**" in tracks_file.read_text()