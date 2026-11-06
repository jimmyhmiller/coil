# Complete actual-emitter diagnostic sample

Candidate d5430910 Stogir O3 kernel, same opaque LLVM caller extended from513
to8193 emissions for each32/128/512-op CIR graph. All25 native execution answers
per size and deterministic text sizes/hashes pass. Sampling only, not timings.
First5-second exploratory sample was partial; retained evidence here is the
second complete-process sample (sample30s ends on process exit). No overlapping
builds/tests/timing jobs. Main worker7866 samples; register-allocation1347(17.12%),
verification1074(13.65%), allocation APIs744(9.46%). Inclusive shares overlap.
Top leaves: free-decision-with-limits438, assigned-indexed-pressure366,
constraints.add331, verify.structure326, classifications240, borrow-node221.
This small actual-backend workload is diagnostic, not a bootstrap profile.

Next inspect register-choice/pressure query cost. Do not assume temporary-buffer
removal is the main fix from source inspection alone. Any allocator query change
must preserve exact choices, masks, fixed interference, hints, boundaries and
spill behavior through differential comparison with unchanged implementation.
