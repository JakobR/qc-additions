# qc-additions


This gem adds some methods to [queue_classic](https://github.com/ryandotsmith/queue_classic) queues that I found helpful:

* `enqueue_if_not_queued(method, *args)`
* `job_count(method, *args)`
* `job_exists?(method, *args)`


An index might help to speed up the `job_count` and `job_exists?` queries. Although, I haven't really tested if there is much to gain by adding this:

```SQL
CREATE INDEX idx_qc_unlocked_job_count ON queue_classic_jobs (q_name, method, args) WHERE locked_at IS NULL;
```


---


I have some of the original code from there:

* https://github.com/ryandotsmith/queue_classic/pull/92

* https://github.com/GreenplumChorus/queue_classic/commit/2719301c2813717692169c1eeab42d317df0ac59
