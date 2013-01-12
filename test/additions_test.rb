require File.expand_path("../helper.rb", __FILE__)

class QueueTest < QCTest

  def test_enqueue_if_not_queued
    QC.enqueue_if_not_queued("Klass.method", "arg1", "arg2")
    QC.enqueue_if_not_queued("Klass.method", "arg1", "arg2")
    QC.lock
    QC.enqueue_if_not_queued("Klass.method", "arg1", "arg2")
    assert_equal(1, QC.job_count("Klass.method", "arg1", "arg2"))
  end

  def test_job_count
    #Should return the count of unstarted jobs that match both method and arguments
    QC.enqueue("Klass.method", "arg1", "arg2")
    QC.enqueue("Klass.method", "arg1", "arg2")
    QC.enqueue("Klass.method", "arg1", "arg2")
    QC.enqueue("Klass.method", "arg3", "arg4")
    QC.enqueue("Klass.other_method", "arg1", "arg2")
    QC.lock  #start the first job
    assert_equal(2, QC.job_count("Klass.method", "arg1", "arg2"))
  end

  def test_job_exists
    # Should return true if an unstarted job with same method and arguments exists
    assert_equal(false, QC.job_exists?("Klass.method"))
    QC.enqueue("Klass.method")
    assert_equal(true, QC.job_exists?("Klass.method"))
    assert_equal(false, QC.job_exists?("Klass.method", "arg1"))
    assert_equal(false, QC.job_exists?("Klass.other_method"))
    assert_equal(false, QC.job_exists?("Klass.other_method", "arg1"))
    QC.lock # start the job
    assert_equal(false, QC.job_exists?("Klass.method"))
  end

end
