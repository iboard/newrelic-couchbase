::Couchbase.module_eval do
  class << self
    include NewRelic::Agent::MethodTracer

    [
      :connect,
      :thread_storage,
      :verify_connection!,
      :reset_thread_storage!,
      :bucket,
      :bucket=
    ].each do |instruction|
      add_method_tracer instruction, "ActiveRecord/Class/#{instruction.to_s}"
    end

    add_method_tracer :new, 'ActiveRecord/Class/connect'
  end
end
