# Specification: Conductor Track Management System

## Overview
Implement a robust track management system for the Conductor extension. This system will be responsible for creating, tracking, and updating "tracks" (units of work) within the Conductor framework. It ensures that the file structure (registry, directories, metadata) remains consistent and that users can easily manage their development lifecycle.

## User Stories
- As a user, I want to create a new track so that I can start working on a new feature or bug fix.
- As a user, I want to see a list of all existing tracks and their status.
- As a user, I want to update the status of a track (e.g., from "new" to "in_progress" or "completed").

## Requirements
- **Track Creation:** Automate the generation of track directories, `metadata.json`, `spec.md`, and `plan.md` from a user description.
- **Registry Management:** Automatically append new tracks to the central `conductor/tracks.md` registry with correct links.
- **ID Generation:** Generate unique, timestamped IDs for each track (e.g., `feature_name_YYYYMMDD`).
- **Status Tracking:** Provide a mechanism (CLI command or file update) to modify the status field in `metadata.json`.
