---
name: ffmpeg-edit-pipeline
description: Build a reproducible FFmpeg editing pipeline for trimming, scaling, compositing, audio mixing, captions, concatenation, and export. Use when video assembly should be scriptable and verifiable.
license: MIT
compatibility: codex, opencode
---

# FFmpeg edit pipeline

1. Inspect every input with `ffprobe`; record streams, frame rate, time base, dimensions, and audio format.
2. Normalize incompatible inputs before concatenation.
3. Keep a readable filter graph and explicit mappings; avoid relying on implicit stream selection.
4. Separate edit masters from distribution encodes.
5. Preserve command logs and fail on missing inputs or nonzero FFmpeg exit status.
6. Inspect the output with `ffprobe` and play the complete file.

Check current FFmpeg documentation before using unfamiliar filters or hardware encoders.
