---
name: ui-video-capture
description: Capture a local application for a product video with repeatable browser state, clean test data, stable timing, and privacy checks. Use when real UI footage is required.
license: MIT
compatibility: codex, opencode
---

# UI video capture

1. Prepare deterministic demo data and a capture-only account or local state.
2. Set viewport, zoom, theme, cursor behavior, animation timing, and notification suppression.
3. Rehearse the exact path and remove loading variance where possible.
4. Record each shot separately with handles before and after the action.
5. Inspect frames for secrets, personal data, browser chrome, flicker, and unreadable text.
6. Log the source URL, build revision, viewport, and take selected for editing.
