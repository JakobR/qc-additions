module QC
  class Queue

    def enqueue_if_not_queued(method, *args)
      enqueue(method, *args) unless job_exists?(method, *args)
    end

    def job_count(method, *args)
      Queries.job_count(name, method, args)
    end

    def job_exists?(method, *args)
      Queries.job_exists?(name, method, args)
    end

  end
end
