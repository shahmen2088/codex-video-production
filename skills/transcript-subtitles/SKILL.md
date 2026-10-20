---
name: transcript-subtitles
description: Produce and review a transcript and subtitles from recorded speech using Whisper or another approved recognizer. Use for captions, voiceover alignment, or transcript cleanup.
license: MIT
compatibility: codex, opencode
---

# Transcript and subtitles

1. Preserve the source audio and record language, model, and decoding settings.
2. Transcribe to a timestamped intermediate format.
3. Correct names, numbers, terminology, punctuation, and hallucinated silence segments against the audio.
4. Split captions by meaning and reading speed; avoid covering important UI.
5. Verify first, middle, and final segments plus every low-confidence or edited segment.
6. Deliver both editable subtitles and the burn-in command when required.
