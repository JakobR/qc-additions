module QC
  module Queries
    extend self

    # TODO:
    # Once PostgreSQL supports JSON comparison, use it.
    # But older versions should be supported too (at least >= 9.0).

    def job_count(q_name, method, args)
      s = "SELECT COUNT(*) FROM #{TABLE_NAME} WHERE q_name = $1 AND method = $2 AND args::text = $3 AND locked_at IS NULL"
      r = Conn.execute(s, q_name, method, JSON.dump(args))
      r["count"].to_i
    end

    def job_exists?(q_name, method, args)
      s = "SELECT 1 AS one FROM #{TABLE_NAME} WHERE q_name = $1 AND method = $2 AND args::text = $3 AND locked_at IS NULL LIMIT 1"
      r = Conn.execute(s, q_name, method, JSON.dump(args))
      !r.nil?
    end

  end
end
